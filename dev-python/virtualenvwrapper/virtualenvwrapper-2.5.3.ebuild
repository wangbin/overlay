# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Enhancements to virtualenv"
HOMEPAGE="http://pypi.python.org/pypi/virtualenvwrapper"
SRC_URI="http://pypi.python.org/packages/source/v/virtualenvwrapper/${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="dev-python/virtualenv"
DEPEND="${RDEPEND}"
