#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh


# ─── ZSH HISTORY ──────────────────────────────────────────────────────────────
# http://zsh.sourceforge.net/Doc/Release/Options.html

export HISTFILE="$HOME/.zsh-history"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

setopt EXTENDED_HISTORY           # write in the ":start:elapsed;command" format
setopt HIST_EXPIRE_DUPS_FIRST     # allow dups, but expire old ones when exceeding HISTSIZE
setopt HIST_FIND_NO_DUPS          # do not find duplicates in history
setopt HIST_IGNORE_ALL_DUPS       # filter duplicates from history
setopt HIST_IGNORE_DUPS           # ignore consecutive dups in history
setopt HIST_IGNORE_SPACE          # don't record commands starting with a space
setopt HIST_REDUCE_BLANKS         # compact consecutive white space chars (cool)
setopt HIST_SAVE_NO_DUPS          # do not save duplicates
setopt INC_APPEND_HISTORY         # incrementally add items to HISTFILE
setopt SHARE_HISTORY              # share history between sessions
setopt HIST_VERIFY                # confirm history expansion (!$, !!, !foo)
