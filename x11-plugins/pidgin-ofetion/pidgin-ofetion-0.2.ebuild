# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit cmake-utils

DESCRIPTION="A fetion plugin for pidgin using libofetion"
HOMEPAGE="http://code.google.com/p/ofetion/"
SRC_URI="http://ofetion.googlecode.com/files/${P}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="nls"

DEPEND="dev-libs/libxml2
	dev-libs/openssl
	>=net-im/pidgin-2.7.0"
RDEPEND="${DEPEND}
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use nls)
	)
	cmake-utils_src_configure
}

