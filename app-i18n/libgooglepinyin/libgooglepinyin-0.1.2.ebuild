# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cmake-utils

DESCRIPTION="A fork from google pinyin on android"
HOMEPAGE="http://code.google.com/p/libgooglepinyin"
SRC_URI="http://libgooglepinyin.googlecode.com/files/${P}.tar.bz2"
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_enable static-libs STATIC)
	)
	cmake-utils_src_configure
}

