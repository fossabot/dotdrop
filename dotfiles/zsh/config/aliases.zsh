[ -f "$HOME/.aliases" ] && . "$HOME/.aliases"

# print $fpath in a human-readable way
alias fpath='print -l $fpath'

#
# Global aliases
# (work at any position within the command line)
#

if [ `command -v clipper` ]; then
  # Mnemonic: "[C]lip"
  alias -g C="|clip"
else
  # Mnemonic: "[C]opy"
  alias -g C="|pbcopy"
fi

# Mnemonic: "[P]aste"
alias -g P="|pbpaste"

# Mnemonic: "[G]rep"
alias -g G='|grep'

# Mnemonic: "[H]ead"
alias -g H="|head"

# Pretty-print JSON.
# Mnemonic: "[J]SON"
if [ `command -v jq` ]; then
  alias -g J="|jq"
else
  alias -g J="|python -m json.tool"
fi

# Mnemonic: "[L]ess"
alias -g L="|less"

# Mnemonic: "[R]eset"
alias -g R=";clear;test -n "$TMUX" && tmux clear-history;"

# Mnemonic: "[F]zf"
if [ `command -v fzf` ]; then
  alias -g F="|fzf -1 --querty=$1 "
fi

# Mnemonic: "[B]at"
if [ `command -v bat` ]; then
  alias -g B="|bat -l sh "
fi
