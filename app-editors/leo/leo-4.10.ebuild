# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/leo/leo-4.10.ebuild,v 1.1 2012/04/08 19:31:17 floppym Exp $

EAPI="3"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.4 2.5 3.* *-pypy-* *-jython"

inherit distutils eutils

MY_P="Leo-${PV}-final"

DESCRIPTION="Leo: Literate Editor with Outlines"
HOMEPAGE="http://leo.sourceforge.net/ http://pypi.python.org/pypi/leo"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.zip"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="spell"

RDEPEND="app-text/silvercity
	dev-python/PyQt4[X]
	spell? ( dev-python/pyenchant )"

DEPEND="${RDEPEND}
	app-arch/unzip"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	distutils_src_prepare
	epatch "${FILESDIR}/${P}-fix_syntax_errors.patch"
	sed -i 's///g' "${S}"/leo/plugins/spellpyx.txt
}

src_install() {
	distutils_src_install
	dohtml -r leo/doc/html/* || die "dohtml failed"
	newicon "${S}"/leo/Icons/leoapp32.png leo.png
	domenu "${FILESDIR}"/leo.desktop || die
}
