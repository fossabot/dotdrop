# ─── settings ───────────────────────────────────────────────────────────── {{{

setopt auto_name_dirs       # Auto add variable-stored paths to ~ list.
setopt autocd               # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt autoparamslash       # tab completing directory appends a slash
setopt autopushd            # make cd push the old directory onto the directory stack
setopt cdable_vars          # Change directory to a path stored in a variable.
setopt extended_glob        # Use extended globbing syntax.
setopt interactivecomments  # Allow comments even in interactive shells (especially for Muness)
setopt multios              # perform implicit tees or cats when multiple redirections are attempted
setopt multios              # Write to multiple descriptors.
setopt nobeep               # don't beep on error
setopt promptsubst          # enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt pushdignoredups      # don't push multiple copies of the same directory onto the directory stack
setopt pushdminus           # swapped the meaning of cd +1 and cd -1; we want them to mean the opposite of what they mean

# }}}

# ─── modules ────────────────────────────────────────────────────────────── {{{
autoload -U colors && colors
# }}}



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
