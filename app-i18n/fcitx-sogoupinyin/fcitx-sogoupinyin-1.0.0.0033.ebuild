# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit unpacker

DESCRIPTION="Sogou Pinyin with Fcitx Wrapper."
HOMEPAGE="http://pinyin.sogou.com/linux/"
SRC_URI="amd64? ( http://download.ime.sogou.com/1402921811/sogou_pinyin_linux_${PV}_amd64.deb )
	x86? ( http://download.ime.sogou.com/1402921811/sogou_pinyin_linux_${PV}_i386.deb )"

LICENSE="Fcitx-Sogou"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

RDEPEND="
	app-arch/bzip2
	app-crypt/mit-krb5
	>=app-i18n/fcitx-4.2.8[qt4,X,dbus]
	!app-i18n/fcitx-qimpanel
	app-i18n/opencc
	dev-libs/expat
	dev-libs/glib
	dev-libs/libffi
	dev-libs/libgcrypt:11
	dev-qt/qtdeclarative:4
	dev-qt/qtgui:4
	media-libs/fontconfig
	media-libs/freetype
	media-libs/libpng
	=media-video/rtmpdump-2.3
	net-dns/libidn
	net-nds/openldap
	net-libs/libssh2
	net-misc/curl[-curl_ssl_gnutls,curl_ssl_openssl]
	sys-apps/dbus
	sys-apps/keyutils
	sys-apps/util-linux
	sys-devel/gcc
	sys-libs/e2fsprogs-libs
	sys-libs/zlib
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libxcb
	x11-libs/libXcursor
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender"

DEPEND="${RDEPEND}"

S=${WORKDIR}

src_prepare() {
	#rm -rf usr/share/upstart
	sed -i -e '/MimeType/s/x-sogouskin/x-sogouskin\;/g' \
		"${S}"/usr/share/applications/fcitx-ui-qimpanel.desktop

	# libpng warning
	for i in $(find ${S} -type f -name "*.png"); do
		convert $i -strip $i
	done
}

src_install() {
	dodir /usr/lib/fcitx
	insinto /usr/lib/fcitx
	insopts -m0755
	doins ${S}/usr/lib/*-linux-gnu/fcitx/*
	
	dodir /usr/share/mime-info
	insinto /usr/share/mime-info
	install -D ${S}/usr/lib/mime/packages/fcitx-ui-qimpanel fcitx-ui-qimpanel.keys

	dodir /usr/share
	insinto /usr/share
	doins -r ${S}/usr/share/*

	dodir /usr/bin
	insinto /usr/bin
	doins  ${S}/usr/bin/*

	dodir /etc/xdg/autostart
	insinto /etc/xdg/autostart
	doins ${S}/etc/xdg/autostart/*

	#if use amd64; then
	#	dosym /usr/lib64/libcurl.so.4 "/usr/lib64/libcurl-gnutls.so.4"
	#elif use x86; then
	#	dosym /usr/lib/libcurl.so.4 "/usr/lib/libcurl-gnutls.so.4"
	#fi
	dosym /usr/lib/libgnutls.so "/usr/lib/libgnutls.so.26"
	#dosym /usr/lib/libgcrypt.so "/usr/lib/libgcrypt.so.11"
}

pkg_postinst() {
	einfo
	einfo "After install the fcitx-sogoupinyin, a restart of fcitx is"
	einfo "expected."
	einfo
	einfo "if you see 请启用fcitx-qimpanel面板程序，以便更好的享受搜狗输入法！"
	einfo "relogin to your desktop, or just start fcitx-qimpanal"
}
