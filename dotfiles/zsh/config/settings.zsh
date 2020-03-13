# ─── settings ───────────────────────────────────────────────────────────── {{{
# zsh.sourceforge.net/Doc/Release/Options.html

setopt auto_name_dirs       # Auto add variable-stored paths to ~ list.
setopt autocd               # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt autoparamslash       # tab completing directory appends a slash
setopt autopushd            # make cd push the old directory onto the directory stack
setopt cdable_vars          # Change directory to a path stored in a variable.
setopt extended_glob        # Use extended globbing syntax.
setopt interactivecomments  # Allow comments even in interactive shells (especially for Muness)
setopt multios              # perform implicit tees or cats when multiple redirections are attempted
setopt nobeep               # don't beep on error
setopt promptsubst          # enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt pushdignoredups      # don't push multiple copies of the same directory onto the directory stack
setopt pushdminus           # swapped the meaning of cd +1 and cd -1; we want them to mean the opposite of what they mean
# setopt no_bare_glob_qual    # disable the PATTERN(QUALIFIERS) syntax
# unsetopt nomatch          # If a pattern for filename generation has no matches, print an error, instead of leaving it unchanged in the argument list
setopt nullglob             # If a pattern for filename generation has no matches, delete the pattern from the argument list instead of reporting an error
unsetopt MULTIBYTE          # support modern chars sets for languages other en

# }}}

# ─── modules ────────────────────────────────────────────────────────────── {{{
autoload -U colors && colors
# }}}

export WORDCHARS="${WORDCHARS//[\/]}"

typeset -A abbreviations
abbreviations=(
  "g"    "git"
  "gd"   "git diff --color"
  "gdc"  "git diff --color --cached"
  "gda"  "git diff --color -w --ignore-all-space --ignore-blank-lines"
  "gf"   "git fetch origin"
  "gst"  "git status --branch --short"
  "gco"  "git checkout"
  "gci"  "git commit -m"
  "gcf"  "git commit --fixup"
  "gca"  "git commit -m 'initial commit' --allow-empty"
  "gb"   "git branch"
  "ga"   "git add"
  "ga."  "git add ."
  "gps"  "git push origin"
  "gpl"  "git pull origin"
  "gr"   "git rebase"
  "gri"  "git rebase -i HEAD~5"
  "ggp"  "git grep --line-number --show-function --color --heading --break"
  "grh"  "git reset --hard"
  "grs"  "git reset --soft"
  "gn"   "git now --all --stat"
  "gcz"  "git cz"
  "dk"   "docker"
  "dkcm" "docker-compose"
  "rmansi" "sed 's/\x1b\[[0-9;]*m//g'"
  "iconv" "iconv -f cp932 -t utf8"
)
magic-abbrev-expand() {
  local MATCH
  LBUFFER=${LBUFFER%%(#m)[.-_a-zA-Z0-9]#}
  LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
  zle self-insert
}
no-magic-abbrev-expand() {
  LBUFFER+=' '
}
zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey " " magic-abbrev-expand
bindkey "^x " no-magic-abbrev-expand

#
# Hooks
#

# autoload -U add-zsh-hook

# auto-ls-after-cd() {
#   emulate -L zsh
#   # Only in response to a user-initiated `cd`, not indirectly (eg. via another
#   # function).
#   if [ "$ZSH_EVAL_CONTEXT" = "toplevel:shfunc" ]; then
#     if [ `command -v exa` ]; then
#       exa --group-directories-first --icons -a -F -I='.DS_Store'
#     else
#       ls -AH
#     fi
#   fi
# }
# add-zsh-hook chpwd auto-ls-after-cd
