#!/bin/bash
# WARNING! This file should not be executed directly.
#
# Various system tweaks
################################################################################

tweaks::increase_inotify() {
  local conf="/etc/sysctl.d/99-sysctl.conf"

  if grep -q fs.inotify.max_user_watches ${conf}; then
    return
  fi

  log::info "Increasing inotify..."
  echo -e "# Increase inofity so apps (like dropbox and phpstorm) can watch tons of files (#hypnoglow)" | sudo tee -a ${conf}
  echo -e "fs.inotify.max_user_watches=131072" | sudo tee -a ${conf}
  sudo sysctl --system
  log::info "..ok"
}

tweaks::switch_to_zsh() {
  local zsh="/usr/bin/zsh"
  if [ "$(getent passwd ${USER} | cut -d: -f7)" != "${zsh}" ]; then
    ask::interactive "Change shell to zsh?" && chsh -s "${zsh}"
  fi
}

tweaks::disable_servises() {
  local -a services=(
    bluetooth.service
    ModemManager.service
  )

  for service in "${services[@]}"; do
    if systemctl -q is-enabled ${service}; then
      log::info "Disabling service ${service}"
      if systemctl -q is-active ${service}; then
        sudo systemctl stop ${service}
      fi
      sudo systemctl disable ${service}
    fi
  done

}

tweaks::setup_docker() {
  if ! groups ${USER} | grep -q docker; then
    sudo gpasswd --add ${USER} docker
  fi

  local filename="override.conf"

  if [ -f "/etc/systemd/system/docker.service.d/${filename}" ]; then
    return 0
  fi

  log::info "Setup docker"
  sudo mkdir -p /etc/systemd/system/docker.service.d/
  sudo cp "${self_dir}/sources/etc/systemd/system/docker.service.d/${filename}" \
    "/etc/systemd/system/docker.service.d/${filename}"

  sudo systemctl daemon-reload
  sudo systemctl restart docker
}

tweaks::setup_virtualbox() {
  if [ ! -x "$(which vboxmanage 2>/dev/null)" ]; then
    return 0
  fi

  if [ -e "/etc/modules-load.d/vbox.conf" ]; then
    return 0
  fi

  log::info "Setup VirtualBox kernel modules autoload"
  sudo cp ${self_dir}/sources/etc/modules-load.d/vbox.conf \
    /etc/modules-load.d/vbox.conf

  # Load modules for current session
  sudo modprobe vboxnetadp
  sudo modprobe vboxnetflt
  sudo modprobe vboxpci
}
