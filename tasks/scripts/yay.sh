#!/usr/bin/env bash

_msg() { printf "\r\033[2K\033[0;32m[ .. ] %s\033[0m\n" "$*"; }

export HOSTNAME="$(hostnamectl | head -n 1 | sed 's/ //g' | cut -d':' -f2-)"

_msg "Check hostname..."
read -p "Hostname [$HOSTNAME]: " -i $HOSTNAME NEWHOSTNAME
if [ "$HOSTNAME -ne $NEWHOSTNAME" ]; then
	sudo hostnamectl set-hostname $NEWHOSTNAME
fi
HOSTNAME=$NEWHOSTNAME

if ! [ -x "$(command -v yay)" ]; then
  _msg "Install yay..."
	read -p "Install yay? [Y/n] " -i "y" IYAY
	if [ "$(tr '[:upper:]' ':lower:' $IYAY)" -eq "y" ]; then
		print "Installing yay"
	fi
	sudo pacman -Syu --noconfirm yay
fi
