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
  git bash bash-completion zsh micro vim tmux tree git-delta-bin \
  wget curl aria2 net-tools trash \
  nodejs npm python python-pip python-pipenv go \
  shfmt shellcheck ripgrep the_silver_searcher bash-language-server \
  visual-studio-code-insiders tilix sublime-text-dev \
  barrier-bin

# system
yay -S --noconfirm --needed \
  bat colorgcc grc exa python-pywal \
  binutils libunity bind-tools \
  jq mlocate neofetch

# ui
yay -S --noconfirm --needed \
  gtk-engines gtk-engine-murrine lib32-libgtk3-nocsd-git \
  appmenu-gtk-module appmenu-qt4 libdbusmenu-glib libdbusmenu-gtk3 libdbusmenu-gtk2 \
  kvantum-qt5 ocs-url hardcode-fixer \
  materia-kde kvantum-theme-materia materia-gtk-theme papirus-icon-theme \
  latte-dock bootsplash-systemd bootsplash-theme-manjaro

# gui apps
yay -Rs --noconfirm firefox
yay -S --noconfirm --needed \
  firefox-appmenu-bin chromium telegram-desktop ktorrent \
  octopi gparted grub-customizer \
  spotify spotify-tray-git spotify-adblock-linux

# vs code
code-insiders --install-extension shan.code-settings-sync

# keyboard
yay -S --noconfirm --needed --useask \
  xclip xsel keynav \
  wmctrl xdotool jumpapp sxhkd xvkbd xmacro xcape \
  xorg-xev xorg-xmodmap xbindkeys_config-gtk2 tk \
  xorg-xrandr xorg-xwininfo

# fonts
yay -S --noconfirm --needed \
  otf-nerd-fonts-fira-code ttf-cascadia-code \
  nerd-fonts-hack nerd-fonts-source-code-pro nerd-fonts-cascadia-code ttf-hack otf-san-francisco-pro \
  ttf-ms-fonts ttf-opensans
