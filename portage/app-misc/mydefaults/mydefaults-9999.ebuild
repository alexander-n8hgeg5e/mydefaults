# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
EGIT_REPO_URI="${CODEDIR}""/${PN}"
inherit git-r3

DESCRIPTION=""
HOMEPAGE=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug prefix"

DEPEND="app-misc/shortcuts"
RDEPEND="${DEPEND}"

src_prepare(){
	if use debug;then
		einfo debug mode
		sed -ir 's/$(\t|[ ])*[#]sed_debug_flag_replace_line[:](.*)(\t|[ ])*$/\2' etc/fish/conf.d/15_functions.fish
	fi
	echo $( pyprep -o '' etc/resolvconf.conf || die "error pyprep" )
	default_src_prepare
}

src_install(){
## make.default
#etc_portage_profile_dir="etc/portage/profile"
#dodir "${etc_portage_profile_dir}"
#insinto "${etc_portage_profile_dir}"
#doins make.defaults

# locale
dodir "etc"
insinto "etc"
doins "etc/locale.conf"
doins "etc/locale.gen"
doins "etc/resolvconf.conf"
doins "etc/gitconfig"

# repos.conf
if ! use prefix ; then
	etc_portage_repos_conf_dir="etc/portage/repos.conf"
	dodir "${etc_portage_repos_conf_dir}"
	insinto "${etc_portage_repos_conf_dir}"
	doins   "${etc_portage_repos_conf_dir}/"*
fi

# fish default conf
etc_fish_confd_dir="etc/fish/conf.d"
dodir "${etc_fish_confd_dir}"
insinto "${etc_fish_confd_dir}"
doins   "${etc_fish_confd_dir}/"*

# etc/vim
etc_portage_pau_dir="etc/vim"
dodir   "${etc_portage_pau_dir}"
insinto "${etc_portage_pau_dir}"
doins   "${etc_portage_pau_dir}/"*

# mutt use flags
etc_portage_pau_dir="etc/portage/package.use"
dodir   "${etc_portage_pau_dir}"
insinto "${etc_portage_pau_dir}"
doins   "${etc_portage_pau_dir}/"*

# keywords
etc_portage_pak_dir="etc/portage/package.accept_keywords"
dodir               "${etc_portage_pak_dir}"
insinto             "${etc_portage_pak_dir}"
doins               "${etc_portage_pak_dir}/"*

# mask
etc_portage_mask_dir="etc/portage/package.mask"
dodir               "${etc_portage_mask_dir}"
insinto             "${etc_portage_mask_dir}"
doins               "${etc_portage_mask_dir}/"*

# unmask
etc_portage_unmask_dir="etc/portage/package.unmask"
dodir               "${etc_portage_unmask_dir}"
insinto             "${etc_portage_unmask_dir}"
doins               "${etc_portage_unmask_dir}/"*

# license
etc_portage_license_dir="etc/portage/package.license"
dodir               "${etc_portage_license_dir}"
insinto             "${etc_portage_license_dir}"
doins               "${etc_portage_license_dir}/"*

# package.env
etc_portage_penv_dir="etc/portage/package.env"
dodir               "${etc_portage_penv_dir}"
insinto             "${etc_portage_penv_dir}"
doins               "${etc_portage_penv_dir}/"*

# env
etc_portage_env_dir="etc/portage/env"
dodir               "${etc_portage_env_dir}"
insinto             "${etc_portage_env_dir}"
doins               "${etc_portage_env_dir}/"*

etc_default_dir="etc/default"
dodir   "${etc_default_dir}"
insinto "${etc_default_dir}"
doins   "${etc_default_dir}/pulse_server"

etc_confd_dir="etc/conf.d"
dodir   "${etc_confd_dir}"
insinto "${etc_confd_dir}"
doins   "${etc_confd_dir}/"*

etc_pdnsd_dir="etc/pdnsd"
dodir   "${etc_pdnsd_dir}"
insinto "${etc_pdnsd_dir}"
doins   "${etc_pdnsd_dir}/"*

etc_ssh_dir="etc/ssh"
dodir   "${etc_ssh_dir}"
insinto "${etc_ssh_dir}"
doins   "${etc_ssh_dir}/"*
}
