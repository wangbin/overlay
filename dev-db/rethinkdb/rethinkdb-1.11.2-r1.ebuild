# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils multilib systemd bash-completion-r1 user

KEYWORDS="~amd64 ~x86"

SLOT="1"
DESCRIPTION="An open-source distributed database built with love."
HOMEPAGE="http://www.rethinkdb.com"
SRC_URI="http://download.rethinkdb.com/dist/${P}.tgz"
LICENSE="AGPL-3"

IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}
		dev-libs/protobuf[static-libs]
		dev-libs/protobuf-c
		dev-util/google-perftools[static-libs]
		dev-libs/boost
		sys-libs/ncurses
		dev-vcs/subversion
		"
pkg_setup() {
	enewgroup rethinkdb 71
	enewuser rethinkdb 71 /bin/bash /var/lib/rethinkdb rethinkdb
}

src_prepare() {
	epatch "${FILESDIR}/${P}-gcc-4.8.patch"
}

src_configure() {
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/usr/var termcap=-lncurses --fetch v8 --static v8
}

src_install() {
	emake STRIP_ON_INSTALL=0 DESTDIR="${D}" install-binaries install-manpages install-web install-data install-config
	newbashcomp packaging/assets/scripts/rethinkdb.bash ${PN}
        systemd_newunit "${FILESDIR}/"${PN}.service "rethinkdb@.service"
	systemd_dotmpfilesd "${FILESDIR}"/rethinkdb.conf
	dodoc COPYRIGHT NOTES README.md
}
