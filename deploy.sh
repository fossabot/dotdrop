#!/usr/bin/env bash
#
# This script is intended to be run with curl, i.e.
#
# bash <(curl -s https://raw.githubusercontent.com/eliasnorrby/dotfiles/develop/bootstrap.sh)

SECONDS=0

set -exo pipefail

export DOTREPO="https://github.com/dotiful/dotdrop"
export DOTFILES="$HOME/code/dots"

_msg() { printf "\r\033[2K\033[0;32m[ .. ] %s\033[0m\n" "$*"; }

_msg "Cloning dotfiles..."
git clone --recurse-submodules $DOTREPO $DOTFILES && cd $DOTFILES

if ! [ -x "$(command -v pip)" ]; then
  _msg "Installing pip..."
  sudo easy_install pip
fi

_msg "Installing dotdrop requirements..."
pip install --user -r ./dotdrop/requirements.txt


# _msg "Running the playbook..."
# ansible-playbook playbook.yml --tags 'all,do_homebrew,do_packages,do_defaults' -v

# _msg "Run post-install script..."
# cd $DOTFILES
# ./post-install.zsh

_msg "Done!"

ELAPSED="$(($SECONDS / 3600))hrs $((($SECONDS / 60) % 60))min $(($SECONDS % 60))sec"

_msg "Setup completed in $ELAPSED"
