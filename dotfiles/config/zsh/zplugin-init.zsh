#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

# 
# ─── helpers ──────────────────────────────────────────────────────────────────
#

turbo0()   { zplugin ice wait"0a" lucid             "${@}"; }
turbo1()   { zplugin ice wait"0b" lucid             "${@}"; }
turbo2()   { zplugin ice wait"0c" lucid             "${@}"; }
zcommand() { zplugin ice wait"0b" lucid as"command" "${@}"; }
zload()    { zplugin load                           "${@}"; }
zsnippet() { zplugin snippet                        "${@}"; }

# ──────────────────────────────────────────────────────────────────────────────

# Load the pure theme, with zsh-async library that's bundled with it
turbo0 pick"async.zsh" src"pure.zsh"; zload sindresorhus/pure

# base16-shell
# https://github.com/chriskempson/base16-shell
turbo0; zload chriskempson/base16-shell


# ─── fzf ──────────────────────────────────────────────────────────────────────
# Install a fuzzy finder (fzf/fzy) and necessary completions and keybindings.

# Install `fzf` bynary and tmux helper script
zcommand from"gh-r";         zload junegunn/fzf-bin
zcommand pick"bin/fzf-tmux"; zload junegunn/fzf
# Create and bind multiple widgets using fzf
turbo0 multisrc"shell/{completion,key-bindings}.zsh" \
        id-as"junegunn/fzf_completions" pick"/dev/null"
    zload junegunn/fzf

# Fuzzy git
# https://github.com/wfxr/forgit
turbo0 has'git'; zload wfxr/forgit

# ─── Fuzzy movement and directory choosing ────────────────────────────────────
# autojump command
# https://github.com/rupa/z
turbo1; zload rupa/z

# Pick from most frecent folders with `Ctrl+g`
# https://github.com/andrewferrier/fzf-z
turbo0; zload andrewferrier/fzf-z

# lets z+[Tab] and zz+[Tab]
# https://github.com/changyuheng/fz
turbo0; zload changyuheng/fz

# ──────────────────────────────────────────────────────────────────────────────

# fast-syntax-highlighting
# (compinit without `-i` spawns warning on `sudo -s`)
turbo0 atinit"ZPLGM[COMPINIT_OPTS]='-i' zpcompinit; zpcdreplay"
zload zdharma/fast-syntax-highlighting

# autosuggestions
# Note: should go _after_ syntax highlighting plugin
turbo0 atload"_zsh_autosuggest_start"
zload zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# additional completion definitions
# https://github.com/zsh-users/zsh-completions
turbo0 blockf; zload zsh-users/zsh-completions

# History search by `Ctrl+R`
# https://github.com/zdharma/history-search-multi-word
turbo1; zload zdharma/history-search-multi-word

# zsh-history-substring-search
# https://github.com/zsh-users/zsh-history-substring-search
turbo1; zload zsh-users/zsh-history-substring-search

# zsh-autopair
# https://github.com/hlissner/zsh-autopair
turbo2 nocompletions; zload hlissner/zsh-autopair

# ──────────────────────────────────────────────────────────────────────────────

# ─── remove temporary functions ───────────────────────────────────────────────
unset -f turbo0
unset -f zload
unset -f zsnippet



# ─── exa ──────────────────────────────────────────────────────────────────────
# zplugin ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
# zplugin light ogham/exa

# OMZ Plugins
# https://github.com/zdharma/zplugin/blob/master/doc/INTRODUCTION.adoc#oh-my-zsh-prezto
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins
#
#zplugin ice wait"0" lucid
#zplugin snippet OMZ::plugins/python/python.plugin.zsh
#zplugin ice wait"0" lucid
#zplugin snippet OMZ::plugins/ruby/ruby.plugin.zsh

#
# Prezto Plugins
# https://github.com/sorin-ionescu/prezto/blob/master/modules
#
#zplugin snippet PZT::modules/python/init.zsh


# zplugin ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick"direnv" src"zhook.zsh" lucid
# zplugin light direnv/direnv
