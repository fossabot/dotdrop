# ─── helpers ──────────────────────────────────────────────────────────────────
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

# ─── fzf ──────────────────────────────────────────────────────────────────────
# alt-d  Choose binary in $PATH with fzf
fzf-binary-from-path() {
  cmd=$(print -rl -- ${(ko)commands} | fzf --height 40% --layout=reverse)
  LBUFFER="${LBUFFER}${cmd}"
  zle redisplay
}
# zle -N insert_binary_from_path
# bindkey '^[d' insert_binary_from_path


# ─── git ──────────────────────────────────────────────────────────────────────
# ctrl+g ctrl+a - Search for git aliases defined in .gitconfig
fzf-gitalias-widget() {
  is_in_git_repo || return
  local out keyword
  out=$(git alias | awk -F "=" '{printf "%-20s -- %s\n",$1,$2}' | fzf --exact)
  keyword=$(echo "$out" | cut -d ' ' -f1)
  LBUFFER=$(echo git "${LBUFFER}${keyword}")
  zle redisplay
}
zle -N fzf-gitalias-widget
bindkey '^[a' fzf-gitalias-widget

# alt-i - Paste the selected entry from locate output into the command line
fzf-locate-widget() {
  local selected
  if selected=$(locate / | fzf -q "$LBUFFER"); then
    LBUFFER=$selected
  fi
  zle redisplay
}
# zle     -N    fzf-locate-widget
# bindkey '\ei' fzf-locate-widget

# ──────────────────────────────────────────────────────────────────────────────


# Speed up zsh compinit by only checking cache once a day
# https://gist.github.com/ctechols/ca1035271ad134841284#gistcomment-2894219
# https://carlosbecker.com/posts/speeding-up-zsh
_zpcompinit_fast() {
  setopt extendedglob local_options
  autoload -Uz compinit
  # local zcd="${ZDOTDIR:-$HOME}/.zcompdump"
  local zcd="${ZPLGM[ZCOMPDUMP_PATH]:-${ZDOTDIR:-$HOME}/.zcompdump}"
  local zcdc="$zcd.zwc"
  # Compile the completion dump to increase startup speed, if dump is newer or doesn't exist,
  # in the background as this is doesn't affect the current session
  if [[ -f "$zcd"(#qN.m+1) ]]; then
    compinit -i -d "$zcd"
    { rm -f "$zcdc" && zcompile "$zcd" } &!
  else
    compinit -C -d "$zcd"
    { [[ ! -f "$zcdc" || "$zcd" -nt "$zcdc" ]] && rm -f "$zcdc" && zcompile "$zcd" } &!
  fi
}
