# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit cmake-utils mercurial

EHG_REPO_URI="https://fetion-pidgin.ofetion.googlecode.com/hg/"

DESCRIPTION="A fetion plugin for pidgin using libofetion"
HOMEPAGE="http://code.google.com/p/ofetion/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
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

