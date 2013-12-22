# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
inherit distutils-r1

DESCRIPTION="Hacker Tray is a minimalist Hacker News app for Linux"
HOMEPAGE="http://captnemo.in/hackertray/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/pygtk
        dev-python/requests
        virtual/python-argparse"

DEPEND="${RDEPEND}"



