# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit cmake-utils

DESCRIPTION="Free and open source implemention of Fetion protocol library and client"
HOMEPAGE="http://ofetion.googlecode.com"
SRC_URI="${HOMEPAGE}/files/${P}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gstreamer libnotify networkmanager xscreensaver"

RDEPEND="dev-db/sqlite:3
	dev-libs/glib:2
	dev-libs/libxml2
	dev-libs/openssl
	gstreamer? ( media-libs/gstreamer )
	networkmanager? (
		net-misc/networkmanager
		dev-libs/dbus-glib
		)
	>=net-libs/libofetion-2.2.0
	libnotify? ( x11-libs/libnotify )
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:2
	xscreensaver? ( x11-libs/libXScrnSaver )"

DEPEND="${RDEPEND}
	dev-util/pkgconfig
	sys-devel/gettext"

DOCS=( AUTHORS README ChangeLog )

src_configure() {
	local mycmakeargs=(
		"$(cmake-utils_use_with gstreamer GSTREAMER)"
		"$(cmake-utils_use_with libnotify LIBNOTIFY)"
		"$(cmake-utils_use_with xscreensaver LIBXSS)"
		"$(cmake-utils_use_with networkmanager NETWORKMANAGER)"
		"$(cmake-utils_use_with networkmanager DBUSGLIB)"
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	use gstreamer || rm "${D}/user/share/openfetion/resource/newmessage.wav"
}
