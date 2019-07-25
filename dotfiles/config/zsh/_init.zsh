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


# ─── spaceship ────────────────────────────────────────────────────────────────
# https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md
#region
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  # package       # Package version
  # node          # Node.js section
  # ruby          # Ruby section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # docker        # Docker section
  # aws           # Amazon Web Services section
  # venv          # virtualenv section
  # pyenv         # Pyenv section
  # kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  # battery       # Battery level and status
  # vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# SPACESHIP_RPROMPT_ORDER=(git)

SPACESHIP_PROMPT_ADD_NEWLINE=true 	       # Adds a newline character before each prompt line
SPACESHIP_PROMPT_SEPARATE_LINE=true 	     # Make the prompt span across two lines
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=false 	 # Shows a prefix of the first section in prompt
SPACESHIP_PROMPT_PREFIXES_SHOW=true 	     # Show prefixes before prompt sections or not
SPACESHIP_PROMPT_SUFFIXES_SHOW=true 	     # Show suffixes before prompt sections or not
# SPACESHIP_PROMPT_DEFAULT_PREFIX=via 	     # Default prefix for prompt sections
# SPACESHIP_PROMPT_DEFAULT_SUFFIX=''         # Default suffix for prompt section

# SPACESHIP_CHAR_PREFIX='' 	  	                              # Prefix before prompt character
SPACESHIP_CHAR_SUFFIX=' ' 	  	                              # Suffix after prompt character
SPACESHIP_CHAR_SYMBOL='❯' 	                                # Prompt character to be shown before any command
# SPACESHIP_CHAR_SYMBOL_ROOT="$SPACESHIP_CHAR_SYMBOL" 	      # Prompt character to be shown before any command for the root user
# SPACESHIP_CHAR_SYMBOL_SECONDARY="$SPACESHIP_CHAR_SYMBOL" 	  # Secondary prompt character to be shown for incomplete commands
SPACESHIP_CHAR_COLOR_SUCCESS="magenta" 	                    # Color of prompt character if last command completes successfully
SPACESHIP_CHAR_COLOR_FAILURE="red" 	                      # Color of prompt character if last command returns non-zero exit-code
SPACESHIP_CHAR_COLOR_SECONDARY="yellow" 	                # Color of secondary prompt character

SPACESHIP_GIT_STATUS_PREFIX=' '
SPACESHIP_GIT_STATUS_SUFFIX=' '
SPACESHIP_GIT_STATUS_UNTRACKED='❔'
SPACESHIP_GIT_STATUS_ADDED='➕'
SPACESHIP_GIT_STATUS_MODIFIED='❕'
SPACESHIP_GIT_STATUS_DELETED='✗'
SPACESHIP_GIT_BRANCH_COLOR="green"
SPACESHIP_GIT_STATUS_AHEAD="⬆"
SPACESHIP_GIT_STATUS_BEHIND="⬇"

SPACESHIP_DIR_TRUNC=4
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_COLOR="blue"

SPACESHIP_EXIT_CODE_SHOW=true
#endregion