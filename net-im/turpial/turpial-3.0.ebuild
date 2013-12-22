# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_5,2_6,2_7} )
DISTUTILS_NO_PARALLEL_BUILD=1

inherit distutils-r1

DESCRIPTION="Lightweight and feature full twitter client"
HOMEPAGE="http://turpial.org.ve/"
SRC_URI="http://files.turpial.org.ve/sources/stable/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="qt4 gtk"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
DEPEND="${PYTHON_DEPS}
	gtk? ( dev-python/pygobject:2[${PYTHON_USEDEP}] )
        qt4? ( dev-python/PyQt4[X,${PYTHON_USEDEP}] )
	>=dev-python/Babel-0.9.1[${PYTHON_USEDEP}]
	>=dev-python/libturpial-0.8.5[${PYTHON_USEDEP}]
	>=dev-python/notify-python-0.1.1[${PYTHON_USEDEP}]
	dev-python/pywebkitgtk[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

python_src_compile() {
	${EPYTHON} setup.py build
}
