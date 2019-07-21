#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh


# #-----------------------------------------------------
# # ensure to only execute on ZSH
# # https://stackoverflow.com/a/9911082/339302
# [ ! -n "$ZSH_VERSION" ] && return



#-----------------------------------------------------
# Development stuffs
#
# dev_config_init=${SCRIPTS}/dev-config/_init.sh

# [[ -f "$dev_config_init"  ]] && source "$dev_config_init"

# unset dev_config_init

#-----------------------------------------------------
# after all, set the PATH for macOS
# [[ -x /bin/launchctl ]] && /bin/launchctl setenv PATH $PATH