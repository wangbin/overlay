# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp subversion

DESCRIPTION="An improved JavaScript mode for GNU Emacs"
HOMEPAGE="http://code.google.com/p/js2-mode/"
ESVN_REPO_URI="http://js2-mode.googlecode.com/svn/trunk/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"

pkg_postinst() {
	elisp-site-regen
	elog "If you want to activate js2-mode automatically for .js files,"
	elog "add the following command to your ~/.emacs file:"
	elog "(add-to-list 'auto-mode-alist '(\""'\\\\.js\\\\'"'\" . js2-mode))"
}
