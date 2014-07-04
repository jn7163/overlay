# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Aucdtect is a CD authenticity detector."
HOMEPAGE="http://true-audio.com/Tau_Analyzer_-_Aucdtect_Algorithm_Details"
SRC_URI="http://www.true-audio.com/ftp/${P}.tgz"

LICENSE="Freeware"
RESTRICT="mirror"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="amd64? ( app-emulation/emul-linux-x86-compat )"
DEPEND="${RDEPEND}"

src_install() {
	dobin auCDtect || die
	dodoc Readme || die
}
