# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit cmake-utils

DESCRIPTION="A gtk GUI to edit fcitx settings"
HOMEPAGE="https://fcitx.googlecode.com"
SRC_URI="${HOMEPAGE}/files/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+gtk3"
RESTRICT="mirror"

RDEPEND="dev-libs/glib:2
	gtk3? ( x11-libs/gtk+:3 )"
DEPEND="${RDEPEND}
	>=app-i18n/fcitx-4.2.4
	dev-util/intltool
	sys-devel/gettext
	app-arch/xz-utils"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_enable gtk3 GTK3 )
	)
	cmake-utils_src_configure
}


