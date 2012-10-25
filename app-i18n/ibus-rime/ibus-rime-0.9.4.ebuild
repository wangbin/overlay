# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit vcs-snapshot

DESCRIPTION="Rime Input Method Engine for IBus Framework"
HOMEPAGE="http://code.google.com/p/rimeime/"
SRC_URI="http://rimeime.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEPEND="app-i18n/ibus
	>=app-i18n/librime-0.9.3
	x11-libs/libnotify"
DEPEND="${COMMON_DEPEND}
	dev-util/cmake"
RDEPEND="${COMMON_DEPEND}
	app-i18n/rime-data"

src_prepare() {
	sed -i -e "/libexecdir/s:/usr/lib:/usr/libexec:" Makefile || die
	sed -i -e "/exec/s:/usr/lib:/usr/libexec:" rime.xml || die
}

# src_prepare() {
#         # patch the cmake system to make it disable data resource build
#         epatch "${FILESDIR}"/rime_enging.patch
# }
