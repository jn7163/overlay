# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit cmake-utils

EGIT_REPO_URI="git://github.com/fcitx/fcitx-table-extra.git"

DESCRIPTION="light weight xlib and xft based ui for fcitx."
HOMEPAGE="http://fcitx.google.com"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

RDEPEND=">=app-i18n/fcitx-4.2.3[table]"
RDEPEND="${RDEPEND}
	dev-util/intltool
	app-arch/xz-utils"

