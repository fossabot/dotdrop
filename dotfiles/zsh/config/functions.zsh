#!/usr/bin/env zsh

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


fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^[d' fzf-history-widget-accept

# ──────────────────────────────────────────────────────────────────────────────


# Speed up zsh compinit by only checking cache once a day
# https://gist.github.com/ctechols/ca1035271ad134841284#gistcomment-2894219
# https://carlosbecker.com/posts/speeding-up-zsh
_zpcompinit_fast() {
  setopt extendedglob local_options
  autoload -Uz compinit
  # local zcd="${ZDOTDIR:-$HOME}/.zcompdump"
  local zcd="${ZINIT[ZCOMPDUMP_PATH]:-${ZDOTDIR:-$HOME}/.zcompdump}"
  local zcdc="$zcd.zwc"
  # Compile the completion dump to increase startup speed, if dump is newer or doesn't exist,
  # in the background as this is doesn't affect the current session
  if [[ -f "$zcd"(#qN.m+1) ]]; then
    compinit -i -d "$zcd"
    { rm -f $zcdc && zcompile $zcd } &!
  else
    compinit -C -d "$zcd"
    { [[ ! -f "$zcdc" || "$zcd" -nt "$zcdc" ]] && rm -f "$zcdc" && zcompile "$zcd" } &!
  fi
}


# ─── base64 ───────────────────────────────────────────────────────────────────

encode64() {
  if [[ $# -eq 0 ]]; then
    cat | base64
  else
    printf '%s' $1 | base64
  fi
}

decode64() {
  if [[ $# -eq 0 ]]; then
    cat | base64 --decode
  else
    printf '%s' $1 | base64 --decode
  fi
}

favencode() {
  if [ "$#" -ne "1" ]; then
    echo "$(basename ${0}) <path to image>"
    echo ""
    echo "Get a website or book on the web using wget.  It's a one-liner, but"
    echo "it uses a lot of options, so I put it in a script.  Takes one option,"
    echo "https://superuser.com/a/385568/706383"
  fi
  # base64 -e "$1" | tr -d ‘\r\n’

  if [[ "$1" == *png ]]; then
    echo "png"
  elif [[ "$1" == *ico ]]; then
    echo "ico"
  else
    echo "nothing"
  fi
}

imencode() {
  # Get imageType
  local imageType=$(file -b --mime-type $1)

  # Check if is a image
  if [[ ! $(echo $imageType | cut -d'/' -f 1) == 'image' ]]; then
    echo "Not an image"
  fi

  local fileExtension=$(echo $imageType | cut -d'/' -f 2)

  if [[ "$fileExtension" == *png ]]; then
    fileType="data:image/png;base64,"
  elif [[ "$fileExtension" == *icon ]]; then
    fileType="data:image/vnd.microsoft.icon;base64,"
  else
    fileType="$imageType"
  fi

  # ENCODED="$(base64 -e $1 | tr -d ‘\r\n’)"
  local ENCODED="$(openssl base64 <$1 | tr -d '\n')"

  local ICON="$fileType$ENCODED"
  echo "$ICON" | clipcopy
}

zf() {
  f=$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | sed -e "s,^$HOME,~," | fzf -e --preview 'tree -C -L 1 -x --noreport --dirsfirst $(echo {} | sed -e "s,^~,$HOME,")')
  cd $(echo $f | sed -e "s,^~,$HOME,")
}
zle -N zf
bindkey ^g zf

# dir="$(_zlua "$1" | fzf -1 -0 --reverse --height 30% --no-sort +m)" && cd "${dir}" || return 1

_select_from() {
  local cmd='command -v'
  for a; do
    case "$a" in
      -c)
        cmd="$2"
        shift 2
        ;;
    esac
  done
  for c; do
    if $cmd "${c%% *}" &> /dev/null; then
      echo "$c"
      return 0
    fi
  done
  return 1
}

_install() {
  local pkgs count
  mapfile -t pkgs
  (( ${#pkgs} > 0 )) || exit
  count="${#pkgs[@]} package"
  (( ${#pkgs[@]} > 1 )) && count+='s'
  printf "installing %s: %s\n" "$count" "${pkgs[*]}"
  $1 "${pkgs[@]}" < /dev/tty
}

yfz() {
  local search packages cmd

  search='yay'
  # [[ -n "$1" ]] && search=$(_select_from 'yay' 'pacaur' 'trizen' 'yaourt' 'packer' 'apacman' 'pacman')

  declare -r esc=$'\033'
  declare -r c_reset="${esc}[0m"
  declare -r c_red="${esc}[31m"
  declare -r c_green="${esc}[32m"
  declare -r c_blue="${esc}[34m"

  if [ ! -z "${1##*[!0-9]*}" ]; then
    cmd="$2"
  else
    cmd="$1"
  fi

  packages=$(fzf -e +s -q "$cmd" -m --cycle --ansi \
    --no-hscroll --info=inline \
    --header='tab to select multiple packages, Ctrl-X for more info on a package' \
    --preview="$search -Si {2}" < <( $search -Ss "$1" |
    gawk '{
      getline descr;
      sub(/ */,"", descr);
      repo = blue "[" gensub(/\/.*/, "", 1) "]" reset;
      name = green gensub(/.*\//, "", 1, $1) reset;
      info = gensub(/[^ ]* /, "", 1);
      print repo, name, info, descr;
    }' blue="$c_blue" green="$c_green" reset="$c_reset"
  ) | cut -d' ' -f2)

  _install "$search -S --noconfirm --needed" <<< "$packages"
}
