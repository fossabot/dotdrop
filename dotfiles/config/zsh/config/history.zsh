#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

#-----------------------------------------------------
# ZSH HISTORY
#
export HISTFILE="$HOME/.history"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE


setopt extendedhistory      # write in the ":start:elapsed;command" format
setopt histexpiredupsfirst   # allow dups, but expire old ones when exceeding HISTSIZE
setopt histfindnodups        # do not find duplicates in history
setopt histignorealldups    # filter duplicates from history
setopt histignoredups       # ignore consecutive dups in history
setopt histignorespace      # don't record commands starting with a space
setopt histreduceblanks     # compact consecutive white space chars (cool)
setopt histsavenodups        # do not save duplicates
setopt incappendhistory     # incrementally add items to HISTFILE
setopt sharehistory            # share history between sessions
setopt histverify           # confirm history expansion (!$, !!, !foo)