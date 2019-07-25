# vim:syntax=sh
# vim:filetype=sh

#
# ─── BINDINGS ────────────────────────────────────────────────────────────────
#

bindkey -e # emacs bindings, set to -v for vi bindings

bindkey '\e[3~'    delete-char           # del
bindkey '\e[17;2~' delete-word           # alt+del

bindkey '\e[Z'     reverse-menu-complete # shift-tab

bindkey '^[f'      forward-word          # opt-RightArrow - move forward one word
bindkey '^[b'      backward-word         # opt-LeftArrow - move backward one word

bindkey '^[[A'     history-substring-search-up
bindkey '^[[B'     history-substring-search-down

# autoload history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "\e[A" history-beginning-search-backward-end  # cursor up
# bindkey "\e[B" history-beginning-search-forward-end   # cursor down

# autoload -U select-word-style
# select-word-style bash # only alphanumeric chars are considered WORDCHARS

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^x' edit-command-line

# bindkey ' ' magic-space # do history expansion on space

# Replace standard history-incremental-search-{backward,forward} bindings.
# These are the same but permit patterns (eg. a*b) to be used.
# bindkey "^r" history-incremental-pattern-search-backward
# bindkey "^s" history-incremental-pattern-search-forward

# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down


#-----------------------------------------------------
# Automatically expanding zsh global aliases
# https://goo.gl/fJbtmJ
#
globalias() {
  zle _expand_alias
  zle expand-word
  zle self-insert
}
zle -N globalias

# space expands all aliases, including global
bindkey -M emacs " " globalias
bindkey -M viins " " globalias

# control-space to make a normal space
bindkey -M emacs "^ " magic-space
bindkey -M viins "^ " magic-space

# normal space during searches
bindkey -M isearch " " magic-space



# #-----------------------------------------------------
# # Set VIM mode
# # e.g. https://dougblack.io/words/zsh-vi-mode.html
# # Key code table: https://www.zsh.org/mla/users/2014/msg00266.html
# #
# # vim mode keybindings
# bindkey -e
# #
# bindkey '^P' up-history                           # ctrl-p
# bindkey '^N' down-history                         # ctrl-n
# bindkey -M viins '^p' up-line-or-history
# bindkey -M viins '^n' down-line-or-history

# # backspace and ^h working even after
# # returning from command mode
# bindkey '^?' backward-delete-char                 # backspace
# bindkey '^h' backward-delete-char                 # ctrl-h
# bindkey '^w' backward-kill-word                   # ctrl-w
# bindkey -M viins '^h' backward-delete-char
# bindkey -M viins '^w' backward-kill-word
# bindkey -M viins '^u' backward-kill-line

# # search history
# bindkey -M viins '^r' history-incremental-pattern-search-backward
# bindkey -M viins '^s' history-incremental-pattern-search-forward

# bindkey "^[[3~" delete-char
# bindkey "^K" kill-whole-line                      # ctrl-k
# bindkey "^A" beginning-of-line                    # ctrl-a
# bindkey "^E" end-of-line                          # ctrl-e
# bindkey "^D" delete-char                          # ctrl-d
# #bindkey "^F" forward-char                         # ctrl-f
# bindkey "^F" forward-word                         # ctrl-f
# #bindkey "^B" backward-char                        # ctrl-b
# bindkey "^B" backward-word                        # ctrl-b

# bindkey -M viins '^a' beginning-of-line
# bindkey -M viins '^e' end-of-line
# bindkey -M viins '^k' kill-line

# bindkey -M viins '^y' yank
# bindkey -M viins '^_' undo
# bindkey -M viins '^x^r' redisplay
# #bindkey -M viins '\eOH' beginning-of-line       # Home
# #bindkey -M viins '\eOF' end-of-line             # End
# #bindkey -M viins '\e[2~' overwrite-mode         # Insert
# #bindkey -M viins '\ef' forward-word             # Alt-f
# #bindkey -M viins '\eb' backward-word            # Alt-b
# #bindkey -M viins '\ed' kill-word                # Alt-d
# #bindkey -M vicmd '/' vi-history-search-forward
# #bindkey -M vicmd '?' vi-history-search-backward
# #bindkey -M vicmd '\e[5~' history-beginning-search-backward  # PageUp
# #bindkey -M vicmd '\e[6~' history-beginning-search-forward   # PageDown


# #-----------------------------------------------------
# # https://github.com/zsh-users/zsh-history-substring-search
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
# bindkey "^R" history-incremental-search-backward  # ctrl-r
# bindkey "[B" history-search-forward               # down arrow
# bindkey "[A" history-search-backward              # up arrow
