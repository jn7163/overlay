# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit gnome2-utils golang-base systemd

DESCRIPTION="A free desktop application that delivers fast, reliable and secure access to the open Internet for users in censored regions."
HOMEPAGE="https://github.com/getlantern/lantern"
SRC_URI="https://github.com/getlantern/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
RESTRICT="mirror"
LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE="systemd"

EGO_PN="github.com/getlantern/flashlight"
P_DATE="20160214"

DEPEND="
	app-arch/bzip2
	app-arch/lz4
	dev-libs/glib:2[xattr]
	dev-libs/libappindicator:3
	media-libs/fontconfig:1.0
	media-libs/freetype:2
	media-libs/harfbuzz[graphite]
	media-libs/libepoxy
	media-libs/mesa
	sys-apps/dbus
	systemd? ( sys-apps/systemd )
	sys-libs/glibc:2.2
	sys-libs/libcap
	sys-libs/zlib
	x11-base/xorg-server
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2[X]"
RDEPEND="${DEPEND}
	dev-lang/go
	!!net-proxy/lantern-bin"

if use amd64; then
	LIB=lib64
elif use x86; then
	LIB=lib
fi

src_prepare() {
	sed -i "s/packageVersion.*/packageVersion = \"${PV}\"/" ${S}/src/github.com/getlantern/flashlight/autoupdate.go
}

src_compile() {
	local LOGGER_TOKEN="$(sed -n 's/^LOGGLY_TOKEN[[:space:]]*:=[[:space:]]\(.*\)$/\1/p' Makefile)"

	GOPATH="${WORKDIR}/${P}:$(get_golibdir_gopath)" \
		GOOS=linux CGO_ENABLED=1 \
		go build -v -x -o ${PN} \
		-ldflags="-w -X 'main.version=${PV}' \
		-X 'main.revisionDate=${P_DATE}' \
		-X 'main.buildDate=${P_DATE}' \
		-X 'github.com/getlantern/flashlight.compileTimePackageVersion=${PV}' \
		-X 'github.com/getlantern/flashlight/logging.logglyToken=${LOGGER_TOKEN}' \
		-linkmode internal -extldflags '-static'" \
		${EGO_PN}
}

src_install() {
	insinto /usr/${LIB}/${PN}
	doins ${S}/installer-resources/linux/lantern.sh
	doins ${S}/installer-resources/lantern.yaml
	doins ${S}/installer-resources/.packaged-lantern.yaml

	exeinto /usr/${LIB}/${PN}
	newexe ${S}/${PN} lantern-binary

	fperms 0755 /usr/${LIB}/lantern/lantern.sh
	dosym /usr/${LIB}/${PN}/lantern.sh /usr/bin/${PN}

	insinto /usr/share/applications
	doins ${S}/installer-resources/linux/lantern.desktop

	insinto /usr/share/icons/hicolor/128x128/apps/
	newins ${S}/installer-resources/linux/icon128x128on.png lantern.png

	use systemd && systemd_dounit "${FILESDIR}/lantern.service"
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
