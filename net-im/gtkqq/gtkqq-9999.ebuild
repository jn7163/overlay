# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools eutils fdo-mime git-2

DESCRIPTION="A QQ client based on gtk+ uses WebQQ protocol."
HOMEPAGE="http://code.google.com/p/gtk-qq/"
EGIT_REPO_URI="git://github.com/kernelhcy/gtkqq.git"
EGIT_BRANCH="dev"
EGIT_BOOTSTRAP="autogen.sh"

LICENSE="GPL-3"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE="gstreamer libnotify proxy"

RDEPEND="sys-libs/zlib
	dev-libs/glib:2
	dev-db/sqlite:3
	x11-libs/gtk+:2
	gstreamer? ( >=media-libs/gstreamer-0.10 )
	libnotify? ( x11-libs/libnotify )"
DEPEND="${RDEPEND}
	sys-devel/libtool
	sys-devel/gettext"

src_configure() {
	econf --disable-unity \
#		$(use_enable gtk3) \
		$(use_enable gstreamer) \
		$(use_enable libnotify) \
		$(use_enable proxy)
	eautoreconf
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
