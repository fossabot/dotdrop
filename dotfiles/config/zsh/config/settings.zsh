#
# ─── SETTINGS ────────────────────────────────────────────────────────────────
#

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


#
# ─── FZF ─────────────────────────────────────────────────────────────────────
#
_fzf_theme_tomorrow_night() {
  local color00='#1d1f21'
  local color01='#282a2e'
  local color02='#373b41'
  local color03='#969896'
  local color04='#b4b7b4'
  local color05='#c5c8c6'
  local color06='#e0e0e0'
  local color07='#ffffff'
  local color08='#cc6666'
  local color09='#de935f'
  local color0A='#f0c674'
  local color0B='#b5bd68'
  local color0C='#8abeb7'
  local color0D='#81a2be'
  local color0E='#b294bb'
  local color0F='#a3685a'

  export FZF_DEFAULT_THEME="
    --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
    --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
    --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
  "
}

_fzf_theme_material_darker() {
  local color00='#212121'
  local color01='#303030'
  local color02='#353535'
  local color03='#4A4A4A'
  local color04='#B2CCD6'
  local color05='#EEFFFF'
  local color06='#EEFFFF'
  local color07='#FFFFFF'
  local color08='#F07178'
  local color09='#F78C6C'
  local color0A='#FFCB6B'
  local color0B='#C3E88D'
  local color0C='#89DDFF'
  local color0D='#82AAFF'
  local color0E='#C792EA'
  local color0F='#FF5370'

  export FZF_DEFAULT_THEME="
    --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
    --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
    --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
  "
}
# _fzf_theme_material_darker
# _fzf_theme_tomorrow_night

export FZF_DEFAULT_THEME='
 --color=fg:-1,bg:-1,hl:#5f87af
 --color=fg+:#d0d0d0,bg+:#262626,hl+:#75b5aa
 --color=info:#afaf87,prompt:#f4bf75,pointer:#ac4142
 --color=marker:#90a959,spinner:#aa759f,header:#87afaf'

# options
# export FZFZ_PREVIEW_COMMAND='tree -C -L 1 -x --noreport --dirsfirst {}'
# export FZF_DEFAULT_OPTS="--no-height --layout=reverse --preview='$FZFZ_PREVIEW_COMMAND | head -\$LINES'"
# export FZF_DEFAULT_COMMAND='fd -t f	-H -L -E .git -E **/node_modules'

# export FZF_DEFAULT_COMMAND="fd --type f -H"
# export FZF_DEFAULT_COMMAND="fd -H -L -E .git -E **/node_modules"
export FZF_DEFAULT_OPTS="
  --layout=reverse
  --no-height
  --cycle
  $FZF_DEFAULT_THEME
"
# export FZF_DEFAULT_OPTS="--layout=reverse --cycle $FZF_DEFAULT_THEME"

export FZF_CTRL_T_COMMAND="fd . -t f -H -I -E .git -E node_modules"
export FZF_CTRL_T_OPTS="+m --preview='bat --style=numbers {}'"

export FZF_ALT_C_COMMAND="fd --no-ignore-vcs -t d -E node_modules"
export FZF_ALT_C_OPTS="+s --preview='tree -C -L 1 -x --noreport --dirsfirst {}'"

# export FZF_CTRL_R_OPTS=""

# export FZF_PREVIEW_LINES=""
# export FZF_PREVIEW_COLUMNS=""

export FZF_COMPLETION_TRIGGER=","

export FZFZ_EXTRA_OPTS="-e"

# ─── z ────────────────────────────────────────────────────────────────────────
# https://github.com/rupa/z
export _Z_DATA="$XDG_CACHE_HOME/zsh/z"

# ─── prompt ───────────────────────────────────────────────────────────────────
# https://github.com/sindresorhus/pure#options

export PURE_PROMPT_SYMBOL='❯'
export PURE_PROMPT_VICMD_SYMBOL='❮'
export PURE_GIT_DOWN_ARROW='⬇'
export PURE_GIT_UP_ARROW='⬆'
zstyle :prompt:pure:git:branch color green
zstyle :prompt:pure:git:arrow color yellow
zstyle :prompt:pure:host color
zstyle :prompt:pure:path color blue
zstyle :prompt:pure:prompt:error color red
zstyle :prompt:pure:prompt:success color magenta
zstyle :prompt:pure:user color 242
zstyle :prompt:pure:user:root color red

# ──────────────────────────────────────────────────────────────────────────────


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
