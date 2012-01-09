# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="A console MSN Messenger client for Linux and other unix systems
that conform to the POSIX standard"
HOMEPAGE="http://gtmess.sourceforge.net"
SRC_URI="http://downloads.sourceforge.net/project/${PN}/${PN}/${PV}/${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" install
}

