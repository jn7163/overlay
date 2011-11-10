# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cmake-utils

DESCRIPTION="Wrapper libgooglepinyin for IBus"
HOMEPAGE="http://code.google.com/p/libgooglepinyin"
SRC_URI="http://libgooglepinyin.googlecode.com/files/${P}.tar.bz2"
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMM_DEPEND="dev-lang/python:2.7"
RDEPEND=">=app-i18n/ibus-1.3.99
	~app-i18n/libgooglepinyin-${PV}"
DEPEND="${RDEPEND}
	${COMM_DEPEND}"

src_prepare() {
	find . -type f -name *.py \
	-exec sed -i 's|/usr/bin/python|/usr/bin/python2|g' {} \; \
	|| die "sed failed"
}


