EAPI="5"
DISTUTILS_SRC_TEST="setup.py"
PYTHON_DEPEND="2:2.6"

inherit distutils

MY_PN="Kivy"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A software library for rapid development of hardware-accelerated multitouch applications."
HOMEPAGE="http://kivy.org/"
SRC_URI="https://pypi.python.org/packages/source/K/Kivy/${MY_P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"
IUSE="doc examples camera pil cairo enchant gst garden"

DEPEND="dev-python/cython
		dev-python/setuptools
		camera? ( media-libs/opencv )
		pil? ( dev-python/imaging )
		cairo? ( dev-python/pycairo )
		enchant? ( dev-python/pyenchant )
		gst? ( dev-python/gst-python )
		garden? ( dev-python/requests )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_install() {
	distutils_src_install
	if use doc; then
		dodoc -r doc
	fi
	if use examples; then
		insinto /usr/share/doc/"${PF}"/
		doins -r examples
	fi
}
