# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libmemcached/libmemcached-1.0.17.ebuild,v 1.1 2013/11/02 18:09:34 robbat2 Exp $

EAPI="4"

inherit eutils multilib

DESCRIPTION="a C client library to the memcached server"
HOMEPAGE="http://libmemcached.org/libMemcached.html"
SRC_URI="http://launchpad.net/${PN}/1.0/${PV}/+download/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~sparc-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE="debug hsieh +libevent static-libs"

DEPEND="net-misc/memcached
	dev-libs/cyrus-sasl
	libevent? ( dev-libs/libevent )"
RDEPEND="${DEPEND}"

src_prepare() {
        epatch "${FILESDIR}/${P}-gcc-4.8.patch"
}

src_configure() {
	econf \
		--disable-dtrace \
		$(use_enable static-libs static) \
		$(use_enable sasl sasl) \
		$(use_enable debug debug) \
		$(use_enable debug assert) \
		$(use_enable hsieh hsieh_hash) \
		${myconf}
}

src_install() {
	emake DESTDIR="${D}" install

	use static-libs || rm -f "${D}"/usr/$(get_libdir)/lib*.la

	dodoc AUTHORS ChangeLog README THANKS TODO
	# remove manpage to avoid collision, see bug #299330
	rm -f "${D}"/usr/share/man/man1/memdump.*
	newman man/memdump.1 memcached_memdump.1
}
