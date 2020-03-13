# go
export GOPATH="$HOME/code/go"
export GOBIN="$HOME/.local/bin"
# export GOROOT="/usr/local/opt/go/libexec"

# rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CARGO_INSTALL_ROOT="$HOME/.local"

# Zsh search path for executable
path=(
  # "$HOME/bin(N-/)"
  # "$HOME/.bin"

  # nodejs
  $HOME/.config/yarn/bin(N-/)
  $HOME/.npm/bin(N-/)

  # use homebrew python version
  /usr/local/opt/python/libexec/bin(N-/)

  # use homebrew ruby version
  /usr/local/opt/ruby/bin(N-/)

  # go
  "$HOME/.local/bin(N-/)" # "$GOPATH/bin(N-/)"

  # cargo
  "$HOME/.cargo/bin(N-/)"

  $path
)

# manpath=(
#   "$ZPFX/share/man"
#   /usr/share/man
#   /usr/local/share/man
#   $manpath
# )

