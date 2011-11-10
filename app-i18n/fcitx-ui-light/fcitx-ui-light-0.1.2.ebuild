# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cmake-utils

DESCRIPTION="A very light weight ui for fcitx, only using xlib and xpm, like go
back to 3.6.x times."
HOMEPAGE="https://github.com/csslayer/fcitx-fcitx-ui-light"
SRC_URI="http://fcitx.googlecode.com/files/${P}.tar.bz2"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=app-i18n/fcitx-4.1.2
	x11-libs/libX11
	media-libs/fontconfig
	media-libs/freetype:2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	sys-devel/gettext"

