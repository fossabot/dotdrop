#!/usr/bin/env bash

# virtualbox & host modules for your kernel
yay -S --noconfirm --needed \
  virtualbox virtualbox-ext-oracle \
  "linux$(uname -r | cut -c 1,3)-virtualbox-host-modules"

# load virtualbox module
sudo /sbin/rcvboxdrv setup
