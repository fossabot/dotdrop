#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

# Two regular plugins loaded without tracking.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

# Plugin history-search-multi-word loaded with tracking.
zinit ice bindmap'^R -> ^S'
zinit load zdharma/history-search-multi-word
