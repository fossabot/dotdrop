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
[[ -n “$key[Home]” ]] && bindkey — “$key[Home]” beginning-of-line
[[ -n “$key[End]” ]] && bindkey — “$key[End]” end-of-line
[[ -n “$key[Insert]” ]] && bindkey — “$key[Insert]” overwrite-mode
[[ -n “$key[Backspace]” ]] && bindkey — “$key[Backspace]” backward-delete-char
[[ -n “$key[Delete]” ]] && bindkey — “$key[Delete]” delete-char
[[ -n “$key[Up]” ]] && bindkey — “$key[Up]” up-line-or-history
[[ -n “$key[Down]” ]] && bindkey — “$key[Down]” down-line-or-history
[[ -n “$key[Left]” ]] && bindkey — “$key[Left]” backward-char
[[ -n “$key[Right]” ]] && bindkey — “$key[Right]” forward-char

[[ -n “$key[Delete]” ]] && bindkey — “$key[Delete]” delete-char


# Fmake sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init () {
    echoti smkx
  }
  function zle-line-finish () {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi
