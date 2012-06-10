# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI="4"

S="${WORKDIR}/phus-${PN}-651030a"

DESCRIPTION="A GAE proxy forked from gappproxy/wallproxy"
HOMEPAGE="https://github.com/phus/goagent"
SRC_URI="https://github.com/phus/goagent/tarball/v${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

RDEPEND="dev-lang/python:2.7[ssl]"

src_prepare() {
	find ${S}/local -type f -name *.py \
	-exec sed -i -re "1s/python2?/python2/" {} \; || die "Failed to sed"
}

src_install() {
	insinto "/etc/"
	newins "${S}/local/proxy.ini" goagent
	rm ${S}/*/*.{bat,exe,vbs,dll,manifest,ini} || die

	insinto "/opt/goagent"
	doins -r "${S}/local" "${S}/server"

	newinitd "${FILESDIR}/goagent-initd" goagent
	dosym /etc/goagent "/opt/goagent/local/proxy.ini"
}

pkg_postinst() {
	elog
	elog "config file: /etc/goagent"
	elog "init script: /etc/init.d/goagent"
	elog
	elog "Usage:"
	elog "vim /etc/goagent"
	elog "vim /opt/goagent/server/golang/fetch/fetch.go"
	elog "vim /opt/goagent/server/golang/app.yaml"
	elog "cd /opt/goagent/server"
	elog "upload={golang|python|php} python2.6 uploader.zip"
	elog "/etc/init.d/goagent start|stop|restart"
	elog
	elog "you need dev-lang/pyton:2.6 to upload"
	elog
}
