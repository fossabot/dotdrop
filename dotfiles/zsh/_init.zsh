#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

if [[ "$SYSTEM" = "Darwin"  ]]; then
  # system executables
  #export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/libexec
  # local system binaries
  export PATH=/usr/local/sbin:/usr/local/bin:$PATH
fi

#-----------------------------------------------------
# ensure to only execute on ZSH
# https://stackoverflow.com/a/9911082/339302
[ ! -n "$ZSH_VERSION" ] && return

#-----------------------------------------------------
# Install zplugin if not installed
#

if [ -z "$ZPLG_HOME" ]; then
  ZPLG_HOME="${ZDOTDIR:-$HOME}/.zplugin"
fi

if ! test -d "$ZPLG_HOME"; then
  git clone https://github.com/psprint/zplugin "$ZPLG_HOME/bin"
  zcompile "$ZPLG_HOME/bin/zplugin.zsh"
fi

# if [ ! -f "$ZPLG_HOME/bin/zplugin.zsh" ]; then
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
# fi

source "$ZPLG_HOME/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# and load the plugins
source "$ZSHCONFIG/zplugin-init.zsh"
#-----------------------------------------------------

# https://github.com/sindresorhus/pure#options
export PURE_PROMPT_SYMBOL='❯'

#-----------------------------------------------------
# Setting autoloaded functions
#
zsh_fpath="${ZSHCONFIG}/autoloaded"

fpath=($zsh_fpath $fpath)

if [[ -d "$zsh_fpath" ]]; then
  for func in $zsh_fpath/*; do
    autoload -Uz ${func:t}
  done
fi
unset zsh_fpath

#-----------------------------------------------------
#
# Load all scripts ${ZSHCONFIG}/lib/*.zsh
#
zsh_lib=${ZSHCONFIG}/lib
if [[ -d "$zsh_lib" ]]; then
  for file in $zsh_lib/*.zsh; do
    source $file
  done
fi
unset zsh_lib


#-----------------------------------------------------
# Development stuffs
#
# dev_config_init=${SCRIPTS}/dev-config/_init.sh

# [[ -f "$dev_config_init"  ]] && source "$dev_config_init"

# unset dev_config_init

#-----------------------------------------------------
# after all, set the PATH for macOS
[[ -x /bin/launchctl ]] && /bin/launchctl setenv PATH $PATH