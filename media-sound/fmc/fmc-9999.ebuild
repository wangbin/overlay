# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2 eutils

EGIT_REPO_URI="git://github.com/hzqtc/fmc.git"

DESCRIPTION="Basic CLI client for FMD"
HOMEPAGE="https://github.com/hzqtc/fmd"
SRC_URI=""


LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="media-sound/fmd"

DEPEND="${RDEPEND}"

src_prepare() {
       epatch "${FILESDIR}/${P}-json-c.patch"
}

src_install() {
        mkdir -p "${D}/usr/bin/"
        cp "${S}/${PN}" "${D}/usr/bin/" || die
}