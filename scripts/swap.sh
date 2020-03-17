#!/usr/bin/env bash

# https://github.com/Nefelim4ag/systemd-swap

echo vm.swappiness=10 | sudo tee -a /etc/sysctl.d/99-sysctl.conf
echo vm.vfs_cache_pressure=50 | sudo tee -a /etc/sysctl.d/99-sysctl.conf
sudo sysctl -p /etc/sysctl.d/99-sysctl.conf
