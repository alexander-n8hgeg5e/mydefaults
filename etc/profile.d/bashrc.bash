#!/bin/bash

# faster interactive check
if [[ $- == *i* ]] ;then
	export is_interactive=1
else
	# for now in all non-interactive cases
	return
fi

# currently unused
#is_login(){
#    shopt -q login_shell
#}

is_interactive(){
    [[ $is_interactive == 1 ]]
}

#### case combining functions with stuff needed in all cases combined with "-" ####

setup_login-interactive(){
    #
    #echo -n .
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWCOLORHINTS=1
    export GIT_PS1_HIDE_IF_PWD_IGNORED=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_SHOWUPSTREAM="auto verbose name"
    #echo -n .
    export INPUTRC="~/.inputrc"
    #echo -n .
    export PROMPT_COMMAND='__git_ps1 "$c_lblue___\u$c_green__@$c_blue___\h:$c_white__\w$c_clear" "$c_lblue___#$c_clear__"'
    #echo -n .
}


####   base functions with stuff needed for the case as base ####

setup_base(){
}


setup_interactive(){
    shopt -qs extglob
    shopt -s cdspell cmdhist
    source ~/.git-prompt.sh
}


setup_login(){

    #update_hostname

    export c_red____='\[\e[31m\]'
    export c_green__='\[\e[32m\]'
    export c_yellow_='\[\e[33m\]'
    export c_blue___='\[\e[34m\]'
    export c_magenta='\[\e[35m\]'
    export c_cyan___='\[\e[36m\]'
    export c_white__='\[\e[37m\]'
    export c_clear__='\[\e[0m\]'

    export c_lred____='\[\e[1;31m\]'
    export c_lgreen__='\[\e[1;32m\]'
    export c_lyellow_='\[\e[1;33m\]'
    export c_lblue___='\[\e[1;34m\]'
    export c_lmagenta='\[\e[1;35m\]'
    export c_lcyan___='\[\e[1;36m\]'
    export c_lwhite__='\[\e[1;37m\]'
    export c_lclear__='\[\e[0m\]'
}

### functions that contain all stuff needed for the case ###

setup_login_interactive(){
    #echo -n .
    setup_base
    #echo -n .
    setup_login
    #echo -n .
    setup_interactive
    #echo -n .
    setup_login-interactive
    #echo -n .
}

debug(){
    echo ${FUNCNAME[ 1 ]} >&2
}


###### main part ######

#is_interactive&&echo -n bash init

# login? -> add env vars export
# interactive? -> add interactive stuff
# pc? -> pc add stuff
#is_login&&echo -n .l. >&2
#is_interactive&&echo -n .i. >&2
#check_pc&&echo -n .pc. >&2
if is_login ; then
    if is_interactive ; then
        #if check_pc ; then
        #    source "${HOME}/.bashrc_pc"
        #    setup_login_interactive_pc
        #else
        setup_login_interactive
        #fi
    else
        #if check_pc ; then
        #    source "${HOME}/.bashrc_pc"
        #    setup_login_pc
        #else
        setup_login
        #fi
    fi
else
    if is_interactive ; then
        #if check_pc ; then
        #    source "${HOME}/.bashrc_pc"
        #    setup_interactive_pc
        #else
        setup_interactive
        #fi
    else
        #if check_pc ; then
        #    source "${HOME}/.bashrc_pc"
        #    setup_pc
        #else
        setup_base
        #fi
    fi
fi
# finish the line


#is_interactive && echo done
