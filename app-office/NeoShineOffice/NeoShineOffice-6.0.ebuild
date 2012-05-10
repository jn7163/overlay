# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit fdo-mime font unpacker

DESCRIPTION="NeoShine Office for Linux"
HOMEPAGE="http://www.nsoffice.cn"
SRC_URI="${HOMEPAGE}/data/upload/downloadCenter/product/${PN}_${PV}_PER_Lin_B40-43.tar"
RESTRICT="mirror"

LICENSE="NSO-EULA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+corefonts"

RDEPEND="
	x86? (
		dev-libs/glib:2
		x11-libs/libICE
		x11-libs/libX11
		x11-libs/libXrender
		x11-libs/libXext
		x11-libs/libSM
		media-libs/fontconfig:1.0
		media-libs/freetype:2
		media-libs/jpeg:62
		media-libs/libmng
		sys-libs/glibc:2.2
		sys-devel/gcc
	)
	amd64? (
		app-emulation/emul-linux-x86-baselibs
		app-emulation/emul-linux-x86-xlibs
		app-emulation/emul-linux-x86-compat
		multilib? (
			sys-devel/gcc
			sys-libs/glibc
		)
	corefonts? ( media-fonts/corefonts )
	)"
DEPEND="${RDEPEND}
	sys-devel/binutils"

S=${WORKDIR}

src_install() {
	exeinto /usr/bin
	exeopts -m0755
	doexe ${S}/usr/bin/wps
	doexe ${S}/usr/bin/wpp

	insinto /usr
	doins -r ${S}/usr/share

	insinto /
	doins -r ${S}/opt
	fperms 0755 /opt/kingsoft/wps-office/office6/wps
	fperms 0755 /opt/kingsoft/wps-office/office6/wpp
}

pkg_postinst() {
	font_pkg_postinst
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
