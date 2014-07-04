# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

DESCRIPTION="AliWangWang for Linux"
HOMEPAGE="http://www.taobao.com/wangwang"
SRC_URI="amd64? ( http://64.120.254.17/repo/bin/${PN}_${PV}-00_amd64.deb )
	x86? ( http://64.120.254.17/repo/bin/${PN}_${PV}-00_i386.deb )"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 amd64 x86"
IUSE=""
RESTRICT="mirror"

RDEPEND="app-arch/deb2targz
	x11-libs/qt-webkit
	x11-libs/qt-sql"
DEPEND="${RDEPEND}"

src_unpack() {
	unpack ./data.tar.gz
}

src_install() {
	insinto "/"
	doins -r "${S}"/usr
}
