EAPI=5
PYTHON_COMPAT=( python{2_{5,6,7},3_{1,2,3}})

inherit distutils-r1

MY_P="${PN}-2013-02-23"

DESCRIPTION="A new regex implementation intended eventually to replace Python's current re module implementation."
HOMEPAGE="https://code.google.com/p/mrab-regex-hg/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S=${WORKDIR}/${MY_P}
