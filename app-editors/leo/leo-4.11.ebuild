# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/leo/leo-4.10.ebuild,v 1.1 2012/04/08 19:31:17 floppym Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils eutils

MY_P="Leo-${PV}-final"

DESCRIPTION="Leo: Literate Editor with Outlines"
HOMEPAGE="http://leo.sourceforge.net/ http://pypi.python.org/pypi/leo"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="spell"

RDEPEND="dev-python/PyQt4
	spell? ( dev-python/pyenchant )"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

src_install() {
	distutils_src_install
	dohtml -r leo/doc/html/* || die "dohtml failed"
	newicon "${S}"/leo/Icons/leoapp32.png leo.png
	domenu "${FILESDIR}"/leo.desktop || die
}
