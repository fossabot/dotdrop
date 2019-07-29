# ─── FZF ────────────────────────────────────────────────────────────────── {{{

export FD_OPTS="-L -c=always -E .git -E node_modules -E .DS_Store"

typeset -AU __FZF
if (( $+commands[fd] )); then
  __FZF[CMD]="fd -H -I $FD_OPTS"
  __FZF[DEFAULT]="${__FZF[CMD]}"
  __FZF[ALT_C]="${__FZF[CMD]} --type d ."
elif (( $+commands[rg] )); then
  __FZF[CMD]='rg --no-messages --no-ignore-vcs'
  __FZF[DEFAULT]="${__FZF[CMD]} --files"
else
  __FZF[DEFAULT]='git ls-tree -r --name-only HEAD || find .'
fi

FZF_DEFAULT_THEME='
 --color=fg:-1,bg:-1,hl:#5f87af
 --color=fg+:#d0d0d0,bg+:#262626,hl+:#75b5aa
 --color=info:#afaf87,prompt:#f4bf75,pointer:#ac4142
 --color=marker:#90a959,spinner:#aa759f,header:#87afaf
'

# [[ "$(file --mime {})" =~ binary ]] && echo {} is a binary file ||
export FZF_PREVIEW_FILES='
  (bat --style=numbers --color=always {} || highlight -O ansi -l {} || cat {}) ||
  tree -C -L 1 -x --noreport --dirsfirst {}
'
export FZF_PREVIEW_DIRS="tree -C -L 1 -x --noreport --dirsfirst {}"
export FZF_PREVIEW_ANY="($FZF_PREVIEW_FILES || $FZF_PREVIEW_DIRS) 2> /dev/null | head -500"

export FZF_DEFAULT_COMMAND="${__FZF[DEFAULT]}"
export FZF_CTRL_T_COMMAND="${__FZF[DEFAULT]} --type f -d 3"
export FZF_ALT_C_COMMAND="${__FZF[ALT_C]}"

export FZF_DEFAULT_OPTS="
  --no-mouse --height 100% -1 --ansi --cycle
  --reverse --multi --inline-info --tabstop 2
  --preview='$FZF_PREVIEW_FILES  2> /dev/null | head -500'
  --preview-window='right:hidden:wrap'
  --bind='f3:execute(bat -l sh --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-y:execute-silent(echo {+} | pbcopy)'
"
export FZF_CTRL_T_OPTS="
  --preview-window right:50%
  --preview '$FZF_PREVIEW_FILES '
  --bind 'enter:execute($EDITOR {})+abort,alt-v:execute(code-insiders -r {})+abort,ctrl-y:execute-silent(pbcopy < {})+abort,alt-y:execute-silent(echo {} | pbcopy)+abort,?:toggle-preview'
  --header '↵ - open, ⌥V - open in VS Code, ^Y - copy, ⌥Y - copy name, ? - toggle preview'
"
export FZF_CTRL_R_OPTS="
  -e
  --preview 'echo {}' --preview-window down:3:hidden:wrap
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort,?:toggle-preview'
  --header '^Y - copy command, ? - toggle preview'
"
export FZF_ALT_C_OPTS="
  --preview '$FZF_PREVIEW_DIRS 2> /dev/null | head -200'
"

# export FZF_COMPLETION_TRIGGER=","
# export FZF_PREVIEW_LINES=""
# export FZF_PREVIEW_COLUMNS=""

# }}}

# ─── z ──────────────────────────────────────────────────────────────────── {{{
# https://github.com/rupa/z

export _Z_DATA="$XDG_CACHE_HOME/zsh/z"
export _ZL_DATA="$XDG_CACHE_HOME/zsh/zlua"

# ─── fz ───────────────────────────────────────────────────────────────────────
# export FZ_HISTORY_CD_CMD=_zlua

# ─── fzf-z ────────────────────────────────────────────────────────────────────
# https://github.com/andrewferrier/fzf-z

# change the preview command
# export FZFZ_PREVIEW_COMMAND="$FZF_PREVIEW_DIRS"
export FZFZ_PREVIEW_COMMAND="$FZF_PREVIEW_DIRS | head -$LINES"
# enable exact match
export FZFZ_EXTRA_OPTS="-e --height=100%"
# dont show directories under the current directory
export FZFZ_SUBDIR_LIMIT=0
# dont filter out duplicates
export FZFZ_UNIQUIFIER="cat"
# export FZFZ_UNIQUIFIER="sed -E \"s-^$HOME($|(/.*))-~\2-\""


# }}}

# ─── prompt ─────────────────────────────────────────────────────────────── {{{
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

# }}}

# ─── plugins ────────────────────────────────────────────────────────────── {{{

# autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# zsh-history-substring-search
# https://github.com/zsh-users/zsh-history-substring-search
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=green,fg=018,bold,underline'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=017,fg=white,bold'

# auto-ls
# https://github.com/desyncr/auto-ls
auto-ls-exa() {
  exa --group-directories-first -a -I=$EXA_IGNORE
}

export AUTO_LS_COMMANDS=(exa)
export AUTO_LS_NEWLINE=1


# zsh-fast-alias-tips
# https://github.com/sei40kr/zsh-fast-alias-tips
export FAST_ALIAS_TIPS_PREFIX="💡 $(tput bold)"
export FAST_ALIAS_TIPS_SUFFIX="$(tput sgr0)"


# multi-word, syntax highlighted history searching
# https://github.com/zdharma/history-search-multi-word
zstyle ":history-search-multi-word" page-size "50"


# }}}
