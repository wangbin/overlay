# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Brise, data resource for Rime Input Method Engine"
HOMEPAGE="http://code.google.com/p/rimeime/"
SRC_URI="http://rimeime.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="app-i18n/librime"
DEPEND="${RDEPEND}"
