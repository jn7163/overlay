# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cmake-utils git-2

EGIT_REPO_URI="git://github.com/csslayer/fcitx-ui-light.git"

DESCRIPTION="A very light weight ui for fcitx, only using xlib and xpm, like go
back to 3.6.x times."
HOMEPAGE="https://github.com/csslayer/fcitx-ui-light"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=app-i18n/fcitx-4.1.1
	x11-libs/libX11
	media-libs/fontconfig
	media-libs/freetype:2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	sys-devel/gettext"

