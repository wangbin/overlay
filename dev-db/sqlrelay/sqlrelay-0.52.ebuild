# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-cpp/rudiments/rudiments-0.40.ebuild,v 1.1 2013/02/07 10:05:32 dev-zero Exp $

EAPI="5"

inherit autotools eutils

DESCRIPTION="Persistent database connection pooling, proxying, load balancing and query routing system for Unix and Linux"
HOMEPAGE="http://sqlrelay.sourceforge.net/"
SRC_URI="mirror://sourceforge/sqlrelay/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="freetds sqlite postgres oracle mysql sybase odbc firebird mdb tcl python perl php erlang ruby java"

DEPEND="=dev-cpp/rudiments-0.43
        freetds? ( dev-db/freetds )
        sqlite? ( dev-db/sqlite:3 )
        postgres? ( dev-db/postgresql-server )
        oracle? ( dev-db/oracle-instantclient-basic )
        sybase? ( dev-db/freetds )
        odbc? ( dev-db/unixODBC )
        firebird? ( dev-db/firebird )
        mdb? ( app-office/mdbtools )
        tcl? ( dev-lang/tcl )
        python? ( dev-lang/python )
        perl? ( dev-lang/perl )
        php? ( dev-lang/php )
        erlang? ( dev-lang/erlang )
        ruby? ( dev-lang/ruby )
        mysql? ( virtual/mysql )
        java? ( virtual/jdk )"
RDEPEND="${DEPEND}"
