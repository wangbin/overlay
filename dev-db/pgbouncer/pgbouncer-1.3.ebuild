# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools eutils

DESCRIPTION="PgBouncer uses libevent for low-level socket handling."
HOMEPAGE="http://pgfoundry.org/projects/pgbouncer/"
SRC_URI="http://pgfoundry.org/frs/download.php/2092/${P}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug"

DEPEND=">=virtual/postgresql-base-8.0
	>=dev-libs/libevent-1.3"
RDEPEND="${DEPENDS}"

pkg_setup() {
	enewgroup pgbouncer
	enewuser pgbouncer -1 -1 -1 pgbouncer
}

src_unpack() {
	unpack ${A}
	cd "${S}"
	eautoreconf -f
}

src_compile() {
	local myconf
	if use debug ; then
		myconf="${myconf} --enable-debug --enable-cassert"
	fi
		econf \
		--with-libevent=/usr \
		$myconf \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install() {

	emake DESTDIR="${D}" install || die "install failed"

	cd "${S}/etc"

	insinto /etc
	newins "${S}/etc/pgbouncer.ini" pgbouncer.conf
	newinitd "${FILESDIR}/pgbouncer-1.2.3" "${PN}"

	cd "${S}"
	dodoc README NEWS AUTHORS
	cd "${S}/doc"
	dodoc *.txt
}

pkg_postinst() {
	einfo "Please read the config.txt for Configuration Directives"
	einfo
	einfo "Please See 'man pgbouncer' for Administration Commands"
	einfo
	einfo "By Default, PgBouncer does not have access to any databases,"
	einfo "You must add a user to the Configuration File, that has atleast"
	einfo "SELECT to your DB and SELECT, UPDATE, INSERT to postgres db"
	einfo
	einfo "These users MUST be in both pg_hba.conf AND auth_file (pgbouncer) "
}
