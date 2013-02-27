# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=(python{2_5,2_6,2_7})

inherit distutils git-2

EGIT_REPO_URI="git://github.com/nvbn/everpad.git"

DESCRIPTION="A python interface wrapper for gnupg's gpg command"
HOMEPAGE="https://github.com/nvbn/everpad"
SRC_URI=""

LICENSE="X11"
SLOT="0"
IUSE="test"

KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}
        dev-python/beautifulsoup
        dev-python/html2text
        dev-python/httplib2
        dev-python/keyring
        dev-python/py-oauth2
        dev-python/regex
        dev-python/sqlalchemy
        dev-python/dbus-python
        dev-python/setuptools
        dev-python/pyside[webkit]
        x11-libs/gdk-pixbuf
	dev-python/python-magic
        "

python_test() {
        esetup.py test
}

python_install() {
	distutils_src_install
        delete_tests() {
                rm -fr "${ED}$(python_get_sitedir)/everpad/tests"
        }
        python_execute_function -q delete_tests
}
