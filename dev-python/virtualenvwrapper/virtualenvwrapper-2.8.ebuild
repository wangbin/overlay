# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Enhancements to virtualenv"
HOMEPAGE="http://www.doughellmann.com/projects/virtualenvwrapper/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="dev-python/stuptools
	dev-python/virtualenv"
DEPEND="${RDEPEND}"
