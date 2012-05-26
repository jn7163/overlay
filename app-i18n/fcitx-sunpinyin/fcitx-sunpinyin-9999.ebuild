# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cmake-utils git-2

EGIT_REPO_URI="git://github.com/fcitx/fcitx-sunpinyin.git"

DESCRIPTION="Fcitx Wrapper for sunpinyin"
HOMEPAGE="https://code.google.com/p/fcitx"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="test"

RDEPEND=">=app-i18n/fcitx-4.1.2
	app-i18n/sunpinyin"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext"

src__configure() {
	local mycmakeargs=(
		$(cmake-utils_use_enable test TEST)
	)
	cmake-utils_src_configure
}

