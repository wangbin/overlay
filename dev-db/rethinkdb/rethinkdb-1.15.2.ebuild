# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit eutils multilib bash-completion-r1 distutils-r1 systemd user

MY_PV="${PV/_p/-}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Open-source distributed database built with love"
HOMEPAGE="http://www.rethinkdb.com/"
SRC_URI="http://download.rethinkdb.com/dist/${MY_P}.tgz"

LICENSE="AGPL-3 python? ( Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+precompiled-web python +tcmalloc"

S="${WORKDIR}/${MY_P}"

RDEPEND="
	>=dev-libs/boost-1.40
	dev-libs/protobuf
	sys-libs/ncurses
	tcmalloc? ( dev-util/google-perftools )
	net-misc/curl
	python? (
		${PYTHON_DEPS}
		dev-libs/protobuf[python]
	)
"

DEPEND="${RDEPEND}
	sys-devel/m4
	dev-libs/protobuf-c
	!precompiled-web? (
		>=net-libs/nodejs-0.10.0[npm]
		dev-python/pyyaml
	)
	${PYTHON_DEPS}
"

RETHINKDB="/usr/bin/rethinkdb"
RETHINKDB_CONFIG_PATH="/etc/${PN}/instances.d"
RETHINKDB_CONFIG_TEMPLATE="${RETHINKDB_CONFIG_PATH}/../default.conf.sample"
RETHINKDB_INSTANCES_PATH="/var/lib/${PN}/instances.d"

pkg_setup() {
	enewgroup rethinkdb
	enewuser rethinkdb -1 -1 "/var/lib/${PN}" rethinkdb
}

src_prepare() {
	epatch_user
	sed -i -e 's: $(TOP)/drivers/all$::' mk/main.mk || die "Disabling drivers by default failed"
}

src_configure() {
	conf_opts=(
		--prefix="/usr"
		--sysconfdir="/etc"
		--localstatedir="/var"
		$(use_enable precompiled-web)
		$(use_with tcmalloc)
		--static=none
	)
	use precompiled-web || conf_opts+=(--allow-fetch)
	./configure "${conf_opts[@]}"
}

src_compile() {
	emake VERBOSE=1
	pushd drivers &>/dev/null
	if use python; then
		pushd python &>/dev/null
		emake VERBOSE=1
		popd &>/dev/null
	fi
	popd &>/dev/null
}

src_install() {
	emake STRIP_ON_INSTALL=0 VERBOSE=0 DESTDIR="${D}" install-binaries install-manpages install-web install-data install-config

	newbashcomp packaging/assets/scripts/rethinkdb.bash ${PN}
	newinitd packaging/assets/init/rethinkdb ${PN}
	systemd_newunit "${FILESDIR}/"${PN}.service "rethinkdb@.service"
	systemd_newtmpfilesd "${FILESDIR}"/${PN}.conf

	dodoc COPYRIGHT NOTES.md README.md

	chown -R rethinkdb:rethinkdb "${D}"/var/lib/rethinkdb

	pushd drivers &>/dev/null
	if use python; then
		pushd python &>/dev/null
		distutils-r1_src_install
		popd &>/dev/null
	fi
	popd &>/dev/null
}

pkg_config() {
	einfo "This will prepare a new RethinkDB instance. Press Control-C to abort."

	einfo "Enter the name for the new instance: "
	read instance_name
	[[ -z "${instance_name}" ]] && die "Invalid instance name"

	local instance_data="${RETHINKDB_INSTANCES_PATH}/${instance_name}"
	local instance_config="${RETHINKDB_CONFIG_PATH}/${instance_name}.conf"
	if [[ -e "${instance_data}" || -e "${instance_config}" ]]; then
		eerror "An instance with the same name already exists:"
		eerror "Check ${instance_data} or ${instance_config}."
		die "Instance already exists"
	fi

	"${RETHINKDB}" create -d "${instance_data}" &>/dev/null \
		|| die "Creating instance failed"
	chown -R rethinkdb:rethinkdb "${instance_data}" \
		|| die "Correcting permissions for instance failed"
	cp "${RETHINKDB_CONFIG_TEMPLATE}" "${instance_config}" \
		|| die "Creating configuration file failed"
	sed -e "s:^# \(directory=\).*$:\1${instance_data}:" \
		-i "${instance_config}" \
		|| die "Modifying configuration file failed"

	einfo "Successfully created the instance at ${instance_data}."
	einfo "To change the default settings edit the configuration file:"
	einfo "${instance_config}"
}
