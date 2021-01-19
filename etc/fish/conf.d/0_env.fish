#############################################
############  environment vars  #############
#############################################
set -x hostnamE (hostname)
not contains $PATH "$HOME""/.bin" ;and set -x PATH "$HOME""/.bin" $PATH
for i in (cat "$EPREFIX"/etc/locale.conf);eval export $i;end
set -x co "$HOME"/.config
set -x cf "$HOME"/.config/fish/config.fish
set -x c  "$EPREFIX"/var/src
set -x cp  "$EPREFIX"/var/src/python_code
set -x cpl  "$EPREFIX"/var/src/pylib/pylib
set -x cv  "$HOME"/.config/nvim
set -x ecf "$EPREFIX"/etc/fish/config.fish
set -x ep "$EPREFIX"/etc/portage
set -x epp "$EPREFIX"/etc/portage/patches
set -x f "$HOME"/.config/fish/config.fish
set -x mc "$EPREFIX"/etc/portage/make.conf
set -x md  "$EPREFIX"/var/src/mydefaults
set -x ed  "$EPREFIX"/var/src/mydefaults/etc/fish/conf.d/0_env.fish
set -x mdf "$EPREFIX"/var/src/mydefaults/etc/fish/conf.d/0_mydefaults.fish
set -x mrc "$HOME"/.muttrc
set -x nc "$HOME"/.config/nvim
set -x pak "$EPREFIX"/etc/portage/package.accept_keywords
set -x pm  "$EPREFIX"/etc/portage/package.mask
set -x ppe "$EPREFIX"/etc/portage/package.env
set -x pe  "$EPREFIX"/etc/portage/env
set -x pu "$EPREFIX"/etc/portage/package.use
set -x s "$EPREFIX"/var/src/shortcuts
set -x w  "$EPREFIX"/var/lib/portage/world
set -x ws "$EPREFIX"/var/lib/portage/world_sets
set -x gh '.git/refs/heads'
set -x vd "$HOME""/.config/nvim"
set -x r "$EPREFIX"/var/src/portage
set -x p "$EPREFIX"/var/src/portage/profiles

set -x  ebuild_edit_version 9999
set -x  EDITOR e
set -x  SUDO_EDITOR "$EPREFIX"/usr/bin/nvim
set -q  BROWSER ; or set -x BROWSER w3m
set -x  sets "$EPREFIX"/var/src/portage/sets

set -g  fish_key_bindings fish_default_key_bindings
set -x  NMON Ukt3nv-.
set -x  MANPAGER w3m
set -q CLIPBOARD_FILE; and test -n $CLIPBOARD_FILE; or set -x CLIPBOARD_FILE /tmp/sodufosuuu
set -q CLIPBOARD_META_FILE; and test -n $CLIPBOARD_META_FILE; or set -x  CLIPBOARD_META_FILE /tmp/sodufosuu

#########################################################################################
#######################  aliases  #######################################################
#########################################################################################
            alias a 'cd ..'
            alias x 'exit'
	    #alias e 'clear;e $argv'
#########################################################################################
####################### greater  ########################################################
#########################################################################################
            if test $hostnamE = esadc
                     set -x fish_greeting                              "Welcome on "(hostname)" ! esadc is "(set var 0;for i in (cat /sys/class/hwmon/hwmon0/temp*_input);set var (math $var + (math $i / 1000));end;set var (math $var / 4);if test $var -lt 45;echo feeling cold. esadc suggests to burn some cpu.;end ;if test $var -gt 80 ;echo feeling hot. esadc suggests to go on.;end ;if test $var -gt 90 ;echo burning like hell. esadc suggests to install a bigger cpu cooler.;end)
            else    
            	 set -x fish_greeting "Welcome on ""$hostnamE"" !"
            end
#########################################################################################

# Put system-wide fish configuration entries here
# or in .fish files in conf.d/
# Files in conf.d can be overridden by the user
# by files with the same name in $XDG_CONFIG_HOME/fish/conf.d

# This file is run by all fish instances.
# To include configuration only for login shells, use
# if status --is-login
#    ...
# end
# To include configuration only for interactive shells, use
# if status --is-interactive
#   ...
# end

# if no color bg_color_flavor is set, set default dark color bg_color_flavor
set -q bg_color_flavor; or set -x bg_color_flavor dark

function setup_colors -a bg_color_flavor
    if test $bg_color_flavor = light
         setup_colors_light
    else if test $bg_color_flavor = dark
         setup_colors_dark
    end
end

function setup_colors_dark
            # colors
            set -x fish_color_autosuggestion                  magenta
            set -x fish_color_cancel                          \x2dr
            set -x fish_color_command                         white
            set -x fish_color_comment                         blue
            set -x fish_color_cwd                             green
            set -x fish_color_cwd_root                        red
            set -x fish_color_end                             brblue
            set -x fish_color_error                           brred
            set -x fish_color_escape                          bryellow\x1e\x2d\x2dbold
            set -x fish_color_history_current                 \x2d\x2dbold
            set -x fish_color_host                            white
            set -x fish_color_match                           \x2d\x2dbackground\x3dbrblue
            set -x fish_color_normal                          white
            set -x fish_color_operator                        bryellow
            set -x fish_color_param                           yellow
            set -x fish_color_quote                           bryellow
            set -x fish_color_redirection                     brblue
            set -x fish_color_search_match                    bryellow\x1e\x2d\x2dbackground\x3dbrblack
            set -x fish_color_selection                       white\x1e\x2d\x2dbold\x1e\x2d\x2dbackground\x3dbrblack
            set -x fish_color_status                          red
            set -x fish_color_user                            brgreen
            set -x fish_color_valid_path                      \x2d\x2dunderline
            # pager color
            set -x fish_pager_color_completion                \x1d
            set -x fish_pager_color_description               yellow\x1eyellow
            set -x fish_pager_color_prefix                    white\x1e\x2d\x2dbold\x1e\x2d\x2dunderline
            set -x fish_pager_color_progress                  brwhite\x1e\x2d\x2dbackground\x3dcyan
end
function setup_colors_light
            set -x fish_color_autosuggestion                  magenta
            set -x fish_color_cancel                          \x2dr
            set -x fish_color_command                         white
            set -x fish_color_comment                         blue
            set -x fish_color_cwd                             green
            set -x fish_color_cwd_root                        red
            set -x fish_color_end                             brblue
            set -x fish_color_error                           brred
            set -x fish_color_escape                          yellow\x1e\x2d\x2dbold
            set -x fish_color_history_current                 \x2d\x2dbold
            set -x fish_color_host                            white
            set -x fish_color_match                           \x2d\x2dbackground\x3dblue
            set -x fish_color_normal                          white
            set -x fish_color_operator                        yellow
            set -x fish_color_param                           yellow
            set -x fish_color_quote                           yellow
            set -x fish_color_redirection                     blue
            set -x fish_color_search_match                    yellow\x1e\x2d\x2dbackground\x3dblack
            set -x fish_color_selection                       white\x1e\x2d\x2dbold\x1e\x2d\x2dbackground\x3dblack
            set -x fish_color_status                          red
            set -x fish_color_user                            green
            set -x fish_color_valid_path                      \x2d\x2dunderline
            # pager color
            set -x fish_pager_color_completion                \x1d
            set -x fish_pager_color_description               yellow\x1eyellow
            set -x fish_pager_color_prefix                    white\x1e\x2d\x2dbold\x1e\x2d\x2dunderline
            set -x fish_pager_color_progress                  white\x1e\x2d\x2dbackground\x3dcyan
end

setup_colors dark
