# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils fdo-mime gnome2-utils vala

DESCRIPTION="Twitter client for Linux"
HOMEPAGE="http://www.ivonunes.net/birdie/"
SRC_URI="https://github.com/ivonunes/birdie/archive/v0.3.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="
	dev-db/sqlite:3
	>=dev-libs/granite-0.2.1
	dev-libs/json-glib
	dev-libs/libdbusmenu:3
	dev-libs/libgee:0
	net-libs/rest:0.7
	media-libs/libcanberra
	net-im/pidgin
	net-libs/webkit-gtk:3
	x11-libs/gtk+:3
	x11-libs/libnotify
	x11-libs/libwnck:3
	x11-libs/libXtst
"
DEPEND="${RDEPEND}
	$(vala_depend)
"

src_prepare() {
	sed \
		-e '/ggdb/d' \
		-e 's:gtk-update-icon-cache:true:g' \
		-e 's:update-desktop-database:true:g' \
		-i icons/CMakeLists.txt data/CMakeLists.txt CMakeLists.txt || die
	vala_src_prepare
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DVALA_EXECUTABLE="${VALAC}"
		-DGSETTINGS_COMPILE=OFF
		)
	cmake-utils_src_configure
}

pkg_preinst() {
	gnome2_icon_savelist
	gnome2_schemas_savelist
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
	gnome2_schemas_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
	gnome2_schemas_update
}
