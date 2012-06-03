# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit cmake-utils git-2

EGIT_REPO_URI="git://github.com/fcitx/fcitx.git"
#EGIT_REVISION="default"

DESCRIPTION="Free Chinese Input Toy for X. Another Chinese XIM Input Method"
HOMEPAGE="https://fcitx.googlecode.com"
SRC_URI="${HOMEPAGE}/files/pinyin.tar.gz
	table? ( ${HOMEPAGE}/files/table.tar.gz )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="+cairo debug gir +gtk +gtk3 lua opencc +pango qt snooper static-libs table test"
RESTRICT="mirror"

RDEPEND="cairo? ( x11-libs/cairo[X]
		pango? ( x11-libs/pango[X] )
		!pango? ( media-libs/fontconfig ) )
	sys-apps/dbus
	gir? ( dev-libs/gobject-introspection )
	gtk? ( x11-libs/gtk+:2
		dev-libs/glib:2
		dev-libs/dbus-glib )
	gtk3? ( x11-libs/gtk+:3
		dev-libs/glib:2
		dev-libs/dbus-glib )
	opencc? ( app-i18n/opencc )
	qt? ( x11-libs/qt-gui:4
		x11-libs/qt-dbus:4 )
	lua? ( dev-lang/lua )
	x11-libs/libX11"
DEPEND="${RDEPEND}
	dev-util/intltool"

update_gtk_immodules() {
	local GTK2_CONFDIR="/etc/gtk-2.0"
	# bug #366889
	if has_version '>=x11-libs/gtk+-2.22.1-r1:2' || has_multilib_profile; then
		GTK2_CONFDIR="${GTK2_CONFDIR}/$(get_abi_CHOST)"
	fi
	mkdir -p "${EPREFIX}${GTK2_CONFDIR}"
	if [ -x "${EPREFIX}/usr/bin/gtk-query-immodules-2.0" ]; then
		"${EPREFIX}/usr/bin/gtk-query-immodules-2.0" > \
		"${EPREFIX}/${GTK2_CONFDIR}/gtk.immodules"
	fi
}

update_gtk3_immodules() {
	if [ -x "${EPREFIX}/usr/bin/gtk-query-immodules-3.0" ]; then
		"${EPREFIX}/usr/bin/gtk-query-immodules-3.0" --update-cache
	fi
}

src_prepare() {
	cp ${DISTDIR}/pinyin.tar.gz ${S}/data || die
	if use table; then
		cp ${DISTDIR}/table.tar.gz ${S}/data/table || die
	fi
}

src_configure() {
	local mycmakeargs=(
			$(cmake-utils_use_enable cairo CAIRO ) \
			$(cmake-utils_use_enable debug DEBUG ) \
			$(cmake-utils_use_enable gir GIR ) \
			$(cmake-utils_use_enable gtk GTK2_IM_MODULE ) \
			$(cmake-utils_use_enable gtk3 GTK3_IM_MODULE ) \
			$(cmake-utils_use_enable lua LUA ) \
			$(cmake-utils_use_enable opencc OPENCC ) \
			$(cmake-utils_use_enable pango PANGO ) \
			$(cmake-utils_use_enable qt QT_IM_MODULE ) \
			$(cmake-utils_use_enable static-libs STATIC ) \
			$(cmake-utils_use_enable snooper Snooper ) \
			$(cmake-utils_use_enable table TABLE ) \
			$(cmake-utils_use_enable test TEST )
	)
	cmake-utils_src_configure
}

pkg_postinst() {
	use gtk && update_gtk_immodules
	use gtk3 && update_gtk3_immodules
}

pkg_postrm() {
	use gtk && update_gtk_immodules
	use gtk3 && update_gtk3_immodules
}

