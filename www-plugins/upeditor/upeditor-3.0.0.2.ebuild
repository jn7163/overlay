# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"


inherit nsplugins versionator

#MY_PV="$(get_version_component_range 1-2)"

DESCRIPTION="unionpay security control plugin"
HOMEPAGE="https://www.95516.com/"
KEYWORDS="~amd64 ~x86"
SRC_URI="x86? ( https://user.95516.com/ctrl/UPEditorLinux_2.tar.gz )
	amd64? ( https://user.95516.com/ctrl/UPEditorLinux64_2.tar.gz  )"

LICENSE="unknown"
RESTRICT="strip mirror"
SLOT="0"
IUSE=""

RDEPEND="dev-libs/openssl"
DEPEND="${RDEPEND}"

S=${WORKDIR}

src_prepare() {
	addwrite /var/lib/installjammer
	#addpredict /var/lib/installjammer

	use amd64 && ./UPEditor-1.0-Linux-x86_64-Install --mode silent \
	--prefix ${S} --temp ${S}/tmp
	use x86 && ./UPEditor-1.0-Linux-x86-Install --mode silent \
	--prefix ${S} --temp ${S}/tmp
}

src_install() {
	insinto "/opt/netscape/plugins"
	doins "${WORKDIR}"/libnpUPEditor.so
	inst_plugin /opt/netscape/plugins/libnpUPEditor.so

	rm -rf "${ROOT}"/var/lib/installjammer || die
}
