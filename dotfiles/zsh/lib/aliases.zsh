# vi:syntax=sh

alias dotdrop="~/dotfiles/dotdrop.sh --cfg=~/dotfiles/config.yaml"

# search aliases
alias als='alias | grep --color=auto -i --'

alias alst='cat ~/.aliases | grep "^alias" | gsed -En "s/alias (\w+)=(.+)/${bold}\1\n  ${normal}\2\n/p"'

# copy the previous command
alias lcc='fc -ln -1 | awk "{\$1=\$1}1" ORS="" | pbcopy'

# ─── CD ───────────────────────────────────────────────────────────────────────

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# directory shortcuts
alias dl="cd ~/Downloads"
alias dc="cd ~/code"
alias dt="cd ~/code/dotfiles"
alias dg="cd ~/code/gws"

# ─── ls ───────────────────────────────────────────────────────────────────────
# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='di=1;34:ln=1;33:so=37:pi=1;36:ex=32:bd=37:cd=37:su=31:sg=31:tw=32:ow=32'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='ExDxhxGxcxhxhxbxbxcxcx'
fi

# # use color output for `ls`
# alias ls="command ls ${colorflag}"

if [ `command -v exa` ]; then
  # https://the.exa.website/docs/colour-themes
	EXA_IGNORE='.DS_Store'
	alias l="exa --group-directories-first -a -F -s=type -I=$EXA_IGNORE"
	alias ll="exa --group-directories-first -l -h -F -I=$EXA_IGNORE"
	alias la="exa --group-directories-first -a -l -h -F -s=type -I=$EXA_IGNORE"
	# alias lA="exa --group-directories-first -a -l -h -G -I=$EXA_IGNORE"
	alias llm="exa --group-directories-first -l -h -F -s='mod' -r -I=$EXA_IGNORE"
	alias llk="exa --group-directories-first -a -l -h -F -s='ext' -I=$EXA_IGNORE"
	alias llK="exa --group-directories-first -a -l -h -F -s='ext' -I=$EXA_IGNORE"
else
  alias l='ls -lhF ${colorflag}'   # list all files colorized in long format
  alias ll='ls -lF ${colorflag}'   # list only directories
  alias la='ls -lhAF ${colorflag}' # list all files colorized in long format
fi

# ─── GIT ──────────────────────────────────────────────────────────────────────
alias g="git"
# alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gst="git status"
alias gcl="git clone --recurse-submodules"
alias glg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
alias lg='lazygit'

# Always enable colored `grep` output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# bat
alias b="bat"
alias bn="bat -n"
alias bl="bat -l"

# ─── COMMAND SHORTCUTS ────────────────────────────────────────────────────────
alias r='exec $SHELL -l' # Reload the shell (i.e. invoke as a login shell)
alias x='chmod +x'
alias h='history'
# alias j='jump'
alias t='tmux'
alias e='exit'
alias wg="wget"
alias cr="curl"
alias cl='clear'
alias ct='column -t'
alias wi="which -a"
alias info='info --vi-keys'
alias mime="file --mime-type -b"

alias path='echo -e ${PATH//:/\\n}' # Print each PATH entry on a separate line
alias trim="tr -d '\n' | pbcopy" # Trim new lines and copy to clipboard
alias cpwd='pwd | xargs echo -n | pbcopy' # copy pwd to the clipboard

if command -v trash &> /dev/null; then
  alias rm='trash'
fi

# ─── NPM ──────────────────────────────────────────────────────────────────────
# https://github.com/dylang/npm-check#options
alias ncu="npm-check --no-emoji -u"
alias ncuy="npm-check --no-emoji -u -y"
alias ncug="npm-check --no-emoji -u -g"

alias ni="npm i"
alias nig="npm i -g"
alias nlg="npm ls -g"
alias nir="npm rm"
alias nirg="npm rm -g"

alias y="yarn"
alias yi="yarn install"
alias ya="yarn add"
alias yad="yarn add -D"
alias yrm="yarn remove"
alias yga="yarn global add"
alias ygr="yarn global remove"
alias ygl="yarn global list"

# ──────────────────────────────────────────────────────────────────────────────


# ─── UTILITIES ────────────────────────────────────────────────────────────────
alias unrar="unrar x"
alias ed='ed -p:'

# QuickLook on macOS
ql() {
  qlmanage -p "$@" 2> /dev/null
}

# ─── EDITORS ──────────────────────────────────────────────────────────────────

if [ `command -v nvim` ]; then
  alias vim=nvim
fi

# alias c='code-insiders -r'
c() {
  if [ $# -eq 0 ]; then
    code-insiders -r .
  else
    code-insiders $@
  fi
}
alias code='code-insiders'
alias v='vim'
alias m='micro'

# ─── HOMEBREW ─────────────────────────────────────────────────────────────────
# alias bri="brew install"
# alias brx="brew uninstall"
alias brs="brew search"
alias bru="brew update && brew upgrade && brew cu -ay"
alias brh="brew home"
alias brf="brew info"
# alias brc="brew cat"
brc() {
  brew cat "$@" | bat -l ruby
}
alias brl="brew ls"
alias brlv="brew leaves | column"

alias cs="brew cask"
alias csl="brew cask ls"
# alias csi="brew cask install"
# alias csx="brew cask uninstall"
alias csz="brew cask zap"
alias csh="brew cask home"
alias csf="brew cask info"
# alias csc="brew cask cat"
csc() {
  brew cask cat "$@" | bat -l ruby
}

# ─── NETWORK ──────────────────────────────────────────────────────────────────
# Flush Directory Service cache
alias flush="sudo killall -HUP mDNSResponder"
# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
# Get internal and external IP address
alias ipi='ipconfig getifaddr en0'
alias ipe='curl ipinfo.io/ip'
# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

alias dmount='diskutil mount'
alias dumount='diskutil unmount'


alias gws='PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:$PATH gws'

# arch
# alias sc="systemctl"
# alias sce="systemctl list-units --type service --state active"
# alias scr="systemctl list-units --type service --state running"

# alias y="yay"
# alias p='pkgsearch'
# alias sp="sudo pacman -Syu --noconfirm"
# alias spu="sudo pacman -Syu --noconfirm"
# alias spr='sudo pacman -Rs --noconfirm'

# ─────────────────────────────────────────────────────────────────────────────

alias ff="/Applications/Firefox.app/Contents/MacOS/firefox"
alias ffb="/Applications/Firefox.app/Contents/MacOS/firefox-bin"


# if [ `command -v grc` ]; then
#   alias grc="grc --colour=auto"

#   alias diskutil="grc diskutil"
#   alias addr="grc ip addr"
#   alias ant="grc ant"
#   alias blkid='grc blkid'
#   alias configure='grc configure'
#   alias df="grc df"
#   alias diff="grc diff"
#   alias dig="grc dig"
#   alias dnf='grc dnf'
#   alias du="grc du"
#   alias env="grc env"
#   alias fdisk="grc fdisk"
#   alias findmnt="grc findmnt"
#   alias free='grc free'
#   alias gcc="grc gcc"
#   alias getfacl='grc getfacl'
#   alias getsebool='grc getsebool'
#   alias id="grc id"
#   alias ifconfig='grc ifconfig'
#   alias iostat_sar="grc iostat_sar"
#   alias iostat='grc iostat'
#   alias ip="grc ip"
#   alias ipaddr="grc ipaddr"
#   alias ipneighbor="grc ipneighbor"
#   alias iproute="grc iproute"
#   alias iptables='sudo grc iptables'
#   alias journalctl='grc journalctl'
#   alias last='grc last'
#   alias link="grc ip link"
#   alias logc="grc cat"
#   alias logh="grc head"
#   alias logt="grc tail"
#   alias lsattr='grc lsattr'
#   alias lsblk='grc lsblk'
#   alias lsmod='grc lsmod'
#   alias lsof="grc lsof"
#   alias lspci='grc lspci'
#   alias make="grc make"
#   alias mount="grc mount"
#   alias mtr="grc mtr"
#   alias mvn="grc mvn"
#   alias neighbor='grc --colour=ip neighbor'
#   alias netstat="grc netstat"
#   alias nmap='grc nmap'
#   alias ping="grc ping -4"
#   alias ps="grc ps"
#   alias pv="grc pv"
#   alias route="grc ip route"
#   alias sar='grc sar'
#   alias semanage='grc semanage'
#   alias semanageboolean="grc semanageboolean"
#   alias semanagefcontext="grc semanagefcontext"
#   alias semanageuser="grc semanageuser"
#   alias showmount="grc showmount"
#   alias ss="grc ss"
#   alias stat="grc stat"
#   alias sysctl='grc sysctl'
#   alias systemctl='grc systemctl'
#   alias tcpdump='grc tcpdump'
#   alias traceroute="grc traceroute"
#   alias tune2fs='grc tune2fs'
#   alias ulimit="grc ulimit"
#   alias unlimit='grc unlimit'
#   alias uptime='grc uptime'
#   alias vmstat="grc vmstat"
#   alias vnstat="grc vnstat"
#   alias w='grc w'
#   alias wdiff="grc wdiff"
#   alias who='grc who'
#   # alias ls="grc ls"
#   # alias warn="grc -c conf.warn cat"
# fi