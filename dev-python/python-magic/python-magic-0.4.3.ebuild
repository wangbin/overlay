# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_{5,6,7},3_{1,2,3}})

inherit distutils-r1

DESCRIPTION="A python wrapper for libmagic"
HOMEPAGE="https://github.com/ahupp/python-magic"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
