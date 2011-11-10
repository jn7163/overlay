# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit cmake-utils mercurial

EHG_PROJECT="openfetion"
EHG_REPO_URI="https://ofetion.googlecode.com/hg"

DESCRIPTION="A command-line version of openfetion"
HOMEPAGE="http://code.google.com/p/ofetion"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="~net-libs/libofetion-${PV}"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

S=${WORKDIR}/${PN}
DOCS=( AUTHORS README ChangeLog )

src_unpack() {
	# workaround
	# http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/eclass/mercurial.eclass?revision=1.15&view=markup
	local S=${WORKDIR}
	mercurial_src_unpack
}
