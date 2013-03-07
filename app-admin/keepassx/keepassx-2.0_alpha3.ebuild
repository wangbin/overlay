# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit qt4-r2 cmake-utils

MY_P=${P/_/-}

DESCRIPTION="Qt password manager compatible with its Win32 and Pocket PC versions"
HOMEPAGE="http://www.keepassx.org/"
SRC_URI="https://www.keepassx.org/dev/attachments/download/22/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86 ~amd64-linux ~x86-linux"
IUSE="debug pch"

DEPEND="dev-qt/qtcore:4
	dev-qt/qtgui:4
	dev-qt/qtxmlpatterns:4
	|| ( >=x11-libs/libXtst-1.1.0 <x11-proto/xextproto-7.1.0 )"
RDEPEND="${DEPEND}"

src_unpack() {
	default
	mv ${MY_P} ${P}
}

src_configure() {
	mycmakeargs=(
		"-DCMAKE_INSTALL_PREFIX=/usr"
		"-DCMAKE_VERBOSE_MAKEFILE=ON"
		"-DCMAKE_BUILD_TYPE:STRING=Release"
		"-DWITH_GUI_TESTS=ON"
		
	)
        cmake-utils_src_configure	
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
	# menu item
        domenu "${FILESDIR}/${PN}.desktop"
}
