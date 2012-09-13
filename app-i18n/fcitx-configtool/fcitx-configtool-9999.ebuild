# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="git://github.com/fcitx/fcitx-configtool.git"
	FCITX_CONFIGTOOL_SRC_URI=""
	FCITX_CONFIGTOOL_ECLASS="git-2"
	KEYWORDS=""
else
	FCITX_CONFIGTOOL_SRC_URI="https://github.com/fcitx/fcitx-configtool/tarball/${PV} -> ${P}.tar.gz"
	RESTRICT="mirror"
	FCITX_CONFIGTOOL_ECLASS="vcs-snapshot"
	KEYWORDS="~amd64 ~x86"
fi

inherit cmake-utils ${FCITX_CONFIGTOOL_ECLASS}

DESCRIPTION="A gtk GUI to edit fcitx settings"
HOMEPAGE="https://fcitx.googlecode.com"
SRC_URI="${FCITX_CONFIGTOOL_SRC_URI}"

LICENSE="GPL-2"
SLOT="0"
IUSE="+gtk3 gtk"
REQUIRED_USE="|| ( gtk gtk3 )"

RDEPEND="dev-libs/glib:2
	gtk? ( x11-libs/gtk+:2 )
	gtk3? ( x11-libs/gtk+:3 )"
DEPEND="${RDEPEND}
	>=app-i18n/fcitx-4.2.6
	app-arch/xz-utils
	app-text/iso-codes
	dev-util/intltool
	dev-libs/libunique:1
	sys-devel/gettext
	virtual/pkgconfig"

src_unpack() {
	${FCITX_CONFIGTOOL_ECLASS}_src_unpack
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_enable gtk GTK2)
		$(cmake-utils_use_enable gtk3 GTK3)
	)
	cmake-utils_src_configure
}
