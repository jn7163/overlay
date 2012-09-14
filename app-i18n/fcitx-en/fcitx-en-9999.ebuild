# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="git://github.com/fcitx/fcitx-en.git"
	FCITX_EN_URI=""
	FCITX_EN_ECLASS="git-2"
	KEYWORDS=""
else
	FCITX_EN_URI="https://github.com/fcitx/fcitx-en/tarball/${PV} -> ${P}.tar.gz"
	RESTRICT="mirror"
	FCITX_EN_ECLASS="vcs-snapshot"
	KEYWORDS="~amd64 ~x86"
fi

inherit cmake-utils ${FCITX_EN_ECLASS}

DESCRIPTION="using customized english dic made by American Contemp Corpus."
HOMEPAGE="https://fcitx.google.com"
SRC_URI="${FCITX_EN_URI}"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND=">=app-i18n/fcitx-4.2.6"
RDEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext"

src_unpack() {
	${FCITX_EN_ECLASS}_src_unpack
}

