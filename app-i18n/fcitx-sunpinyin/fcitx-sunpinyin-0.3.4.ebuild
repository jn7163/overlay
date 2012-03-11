# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit cmake-utils

DESCRIPTION="Fcitx Wrapper for sunpinyin"
HOMEPAGE="https://code.google.com/p/fcitx"
SRC_URI="http://fcitx.googlecode.com/files/${P}.tar.xz"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=">=app-i18n/fcitx-4.2.1
	app-i18n/sunpinyin"
DEPEND="${RDEPEND}
	dev-util/intltool
	app-arch/xz-utils"

src__configure() {
	local mycmakeargs=(
		$(cmake-utils_use_enable test TEST)
	)
	cmake-utils_src_configure
}

