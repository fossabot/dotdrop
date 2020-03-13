# vim:syntax=sh
# vim:filetype=sh

#
# ─── BINDINGS ────────────────────────────────────────────────────────────────
#

bindkey -e # emacs bindings, set to -v for vi bindings

typeset -g -A key

key[F1]='^[OP'
key[F2]='^[OQ'
key[F3]='^[OR'
key[F4]='^[OS'
key[F5]='^[[15~'
key[F6]='^[[17~'
key[F7]='^[[18~'
key[F8]='^[[19~'
key[F9]='^[[20~'
key[F10]='^[[21~'
key[F11]='^[[23~'
key[F12]='^[[24~'
# key[Backspace]='^[[3~'
key[Backspace]='^?'
key[Insert]='^[[2~'
key[Home]='^[[H'
key[PageUp]='^[[5~'
key[Delete]='^[[3~'
key[End]='^[[F'
key[PageDown]='^[[6~'
key[Up]='^[[A'
key[Left]='^[[D'
key[Down]='^[[B'
key[Right]='^[[C'
# key[Menu]='^[[C'

# setup key accordingly
bindkey '\e[17;2~' delete-word           # alt+del
bindkey '\e[3;3~' kill-word

[[ -n "${key[Home]}" ]]      && bindkey "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}" ]]       && bindkey "${key[End]}"       end-of-line
[[ -n "${key[Insert]}" ]]    && bindkey "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}" ]]    && bindkey "${key[Delete]}"    delete-char
[[ -n "${key[Up]}" ]]        && bindkey "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}" ]]      && bindkey "${key[Down]}"      down-line-or-history
[[ -n "${key[Right]}" ]]     && bindkey "${key[Right]}"     forward-char
[[ -n "${key[Delete]}" ]]    && bindkey "${key[Delete]}"    delete-char

[[ -n ${key[Left]} ]]        && bindkey "${key[Left]}"      backward-char


# Fmake sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
# if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
#   function zle-line-init () {
#     echoti smkx
#   }
#   function zle-line-finish () {
#     echoti rmkx
#   }
#   zle -N zle-line-init
#   zle -N zle-line-finish
# fi


bindkey '\e[Z'     reverse-menu-complete # shift-tab

if [[ "$OSTYPE" == "darwin"* ]]; then
  bindkey '^[f'      forward-word          # opt-RightArrow - move forward one word
  bindkey '^[b'      backward-word         # opt-LeftArrow - move backward one word
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
  bindkey "^[[1;5C" forward-word
  bindkey "^[[1;5D" backward-word
fi

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

globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
   fi
   zle self-insert
}

zle -N globalias

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches


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
