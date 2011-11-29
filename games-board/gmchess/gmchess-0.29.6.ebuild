# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="gmchess is an gtkmm implementation of Chinese chess"
HOMEPAGE="http://gmchess.googlecode.com"
SRC_URI="${HOMEPAGE}/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="nls"
RESTRICT="mirror"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-cpp/gtkmm:3.0
	dev-util/intltool"

src_compile() {
	econf \
	$(use_enable nls)
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}
