# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit cmake-utils

DESCRIPTION="Fcitx Wrapper for googlepinyin."
HOMEPAGE="http://code.google.com/p/fcitx"
SRC_URI="http://fcitx.googlecode.com/files/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

RDEPEND=">=app-i18n/fcitx-4.2.3
	>=app-i18n/libgooglepinyin-0.1.2"
DEPEND="${RDEPEND}
	dev-util/intltool
	app-arch/xz-utils"
