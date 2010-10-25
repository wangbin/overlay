# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="A high-level Python Screen Scraping framework"
HOMEPAGE="http://scrapy.org/"
SRC_URI="http://pypi.python.org/packages/source/S/Scrapy/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ssl json"

RDEPEND=">=dev-python/twisted-2
	>=net-zope/zope-interface-3.0.1
    >=dev-libs/libxml2-2.6.28
    ssl? ( dev-python/pyopenssl )
    json? ( dev-python/simplejson )"
DEPEND="${RDEPEND}"
