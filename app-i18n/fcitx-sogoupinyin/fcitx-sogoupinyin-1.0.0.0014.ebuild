# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit unpacker

DESCRIPTION="Sogou Pinyin with Fcitx Wrapper."
HOMEPAGE="http://pinyin.sogou.com/linux/"
SRC_URI="amd64? ( http://download.ime.sogou.com/1398087082/sogou_pinyin_linux_${PV}_amd64.deb )
	x86? ( http://download.ime.sogou.com/1398087082/sogou_pinyin_linux_${PV}_i386.deb )"

LICENSE="Fcitx-Sogou"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

RDEPEND=">=app-i18n/fcitx-4.2.8[qt4,X,dbus]
	!app-i18n/fcitx-qimpanel
	dev-qt/qtdeclarative:4
	dev-qt/qtgui:4
	net-misc/curl[curl_ssl_gnutls,-curl_ssl_openssl]"

DEPEND="${RDEPEND}"

S=${WORKDIR}

src_prepare() {
	rm -rf usr/share/upstart
}

src_install() {
	dodir /usr/lib/fcitx
	insinto /usr/lib/fcitx
	insopts -m0755
	doins ${S}/usr/lib/*-linux-gnu/fcitx/*
	
	#dodir /usr/share/mime-info
	#insinto /usr/share/mime-info
	#doins /usr/lib/mime/packages/fcitx-ui-qimpanel

	dodir /usr/share
	insinto /usr/share
	doins -r ${S}/usr/share/*

	dodir /usr/bin
	insinto /usr/bin
	doins  ${S}/usr/bin/*

	dodir /etc/xdg/autostart
	insinto /etc/xdg/autostart
	doins ${S}/etc/xdg/autostart/*

	if use amd64; then
		dosym /usr/lib64/libcurl.so.4 "/usr/lib64/libcurl-gnutls.so.4"
	elif use x86; then
		dosym /usr/lib/libcurl.so.4 "/usr/lib/libcurl-gnutls.so.4"
	fi
}

pkg_postinst() {
	einfo
	einfo "After install the fcitx-sogoupinyin, a restart of fcitx is"
	einfo "expected."
	einfo
	einfo "if you see 请启用fcitx-qimpanel面板程序，以便更好的享受搜狗输入法！"
	einfo "relogin to your desktop, or just start fcitx-qimpanal"
}
