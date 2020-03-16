#!/usr/bin/env bash


#
# ─── PACMAN ───────────────────────────────────────────────────────────────────
#

# enable colored output
sudo sed -i 's/#Color/Color/' /etc/pacman.conf

# enable "pamac AUR"
sudo sed -i 's/#EnableAUR/EnableAUR/' /etc/pamac.conf

# check for AUR Updates
sudo sed -i 's/#CheckAURUpdates/CheckAURUpdates/' /etc/pamac.conf

# ──────────────────────────────────────────────────────────────────────────────


#
# ─── PACMAN ───────────────────────────────────────────────────────────────────

# remove defaults
sudo pacman -Rs --noconfirm \
  hplip konversation steam-manjaro thunderbird

# ──────────────────────────────────────────────────────────────────────────────

# install yay
sudo pacman -Sy --noconfirm yay-bin pacui


# dev
yay -S --noconfirm --needed \
  git bash zsh micro vim tmux wget curl aria2 git-delta-bin \
  nodejs npm python python-pip python-pipenv go \
  visual-studio-code-insiders tilix shfmt shellcheck \
  ripgrep the_silver_searcher

# system
yay -S --noconfirm --needed \
  binutils libunity bind-tools \
  colorgcc grc \
  xclip wmctrl xdotool keynav mlocate neofetch

# fonts
yay -S --noconfirm --needed \
  otf-nerd-fonts-fira-code nerd-fonts-cascadia-code ttf-cascadia-code \
  nerd-fonts-hack ttf-hack otf-san-francisco-pro

# ui
yay -S --noconfirm --needed \
  gtk-engines gtk-engine-murrine gtk3-nocsd-git \
  appmenu-gtk-module appmenu-qt4 libdbusmenu-glib libdbusmenu-gtk3 libdbusmenu-gtk2 \
  kvantum-qt5 ocs-url hardcode-fixer \
  materia-kde kvantum-theme-materia materia-gtk-theme papirus-icon-theme \
  latte-dock \
  bootsplash-systemd bootsplash-theme-manjaro

# gui apps
yay -Rs --noconfirm firefox
yay -S --noconfirm --needed \
  firefox-appmenu-bin chromium telegram-desktop ktorrent \
  octopi gparted grub-customizer \
  spotify spotify-tray-git spotify-adblock-linux

# vs code
code-insiders --install-extension shan.code-settings-sync

# virtualbox & host modules for your kernel
yay -S --noconfirm --needed \
  virtualbox virtualbox-ext-oracle \
  "linux$(uname -r | cut -c 1,3)-virtualbox-host-modules"

# keyboard
yay -S --noconfirm --needed \
  xorg-xev

# load virtualbox module
sudo /sbin/rcvboxdrv setup
