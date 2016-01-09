# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit gnome2-utils unpacker

DESCRIPTION="A free desktop application that delivers fast, reliable and secure access to the open Internet for users in censored regions."
HOMEPAGE="https://github.com/getlantern/lantern"
SRC_URI="
    x86?   ( https://raw.githubusercontent.com/getlantern/${PN}-binaries/master/${PN}-installer-beta-32-bit.deb )
	amd64? ( https://raw.githubusercontent.com/getlantern/${PN}-binaries/master/${PN}-installer-beta-64-bit.deb )"

SLOT="0"
RESTRICT="mirror"
LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-arch/lz4
	dev-libs/libappindicator:3
	dev-libs/libffi
	media-gfx/graphite2
	media-libs/fontconfig
	media-libs/libepoxy
	media-libs/libpng
	media-libs/mesa
	sys-apps/dbus
	sys-libs/glibc
	sys-libs/libcap
	sys-libs/zlib
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3[X,introspection]
	x11-libs/libdrm
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libxcb
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libxshmfence
	x11-libs/libXxf86vm
	x11-libs/pango"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	insinto /
	doins -r "${S}/usr"
	fperms 0755 /usr/lib/lantern/lantern{.sh,-binary}

	insinto /usr/share/applications
	doins "${FILESDIR}/lantern.desktop"
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
