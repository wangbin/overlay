# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pyGPG/pyGPG-9999.ebuild,v 1.3 2012/12/17 19:36:18 mgorny Exp $

EAPI="5"

PYTHON_COMPAT=(python{2_5,2_6,2_7})

EGIT_MASTER="everpad"
EGIT_BRANCH="master"

inherit distutils-r1 python-r1 git-2

EGIT_REPO_URI="git://github.com/nvbn/everpad.git"

DESCRIPTION="A python interface wrapper for gnupg's gpg command"
HOMEPAGE="https://github.com/nvbn/everpad"
SRC_URI=""

LICENSE="X11"
SLOT="0"
IUSE=""

KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}
        dev-python/beautifulsoup
        dev-python/html2text
        dev-python/httplib2
        dev-python/keyring
        dev-python/oauth2
        dev-python/regex
        dev-python/sqlalchemy
        dev-python/dbus-python
        dev-python/setuptools
        dev-python/pyside
        x11-libs/gdk-pixbuf
        "

python_install_all() {
        distutils-r1_python_install_all
}
