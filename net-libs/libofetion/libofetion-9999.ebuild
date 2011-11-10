# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit cmake-utils mercurial

DESCRIPTION="Free and open source implemention of Fetion library"
HOMEPAGE="http://code.google.com/p/ofetion"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-db/sqlite:3
	dev-libs/libxml2
	dev-libs/openssl"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	sys-devel/gettext"

EHG_REPO_URI="https://ofetion.googlecode.com/hg"
EHG_PROJECT="openfetion"

S=${WORKDIR}/${PN}
DOCS=( AUTHORS README ChangeLog )

src_unpack() {
	local S=${WORKDIR}
	mercurial_src_unpack
}
