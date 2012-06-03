# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit cmake-utils

DESCRIPTION="light weight xlib and xft based ui for fcitx."
HOMEPAGE="http://fcitx.google.com"
SRC_URI="${HOMEPAGE}/files/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

RDEPEND=">=app-i18n/fcitx-4.2.4[table]"
RDEPEND="${RDEPEND}
	dev-util/intltool
	app-arch/xz-utils"

