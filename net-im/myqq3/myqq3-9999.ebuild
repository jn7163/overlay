# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit toolchain-funcs subversion


ESVN_REPO_URI="http://myqq3.googlecode.com/svn/trunk/"
HOMEPAGE="http://myqq3.googlecode.com"
DESCRIPTION="A portable open source qq CLI client"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="virtual/libc"
RDEPEND="${DEPEND}"

src_compile(){
	make -C src -flinux.mak CC="${CHOST}-gcc" \
	CFLAGS="${CFLAGS} -c -Wall" LDFLAGS="${LDFLAGS} -lpthread" \
	LD="${CHOST}-gcc"
}

src_install(){
	dodir /usr/bin
	install myqq ${D}/usr/bin/myqq
}
