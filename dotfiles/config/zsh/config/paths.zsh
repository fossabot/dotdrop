# go
export GOPATH="$HOME/code/go"
# export GOROOT="/usr/local/opt/go/libexec"

# Zsh search path for executable
path=(
  "$HOME/bin(N-/)"
  # "$HOME/.bin"
  
  # nodejs
  "$HOME/.config/yarn/bin(N-/)"
  "$HOME/.npm/bin(N-/)"

  # use homebrew python version
  /usr/local/opt/python/libexec/bin(N-/)

  # use homebrew ruby version
  /usr/local/opt/ruby/bin(N-/)

  # go
  "$GOPATH/bin(N-/)"

  "$HOME/.local/bin(N-/)"
  $path
)

# manpath=(
#   "$ZPFX/share/man"
#   /usr/share/man
#   /usr/local/share/man
#   $manpath
# )

