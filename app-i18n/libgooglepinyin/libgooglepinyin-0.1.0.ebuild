# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils

DESCRIPTION="A fork from google pinyin on android"
HOMEPAGE="http://code.google.com/p/libgooglepinyin/"
SRC_URI="http://libgooglepinyin.googlecode.com/files/${P}.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="app-i18n/ibus
	app-i18n/opencc"

DEPEND="${RDEPEND}"
