#!/usr/bin/env bash

# disable LVM
systemctl mask lvm2-monitor.socket
systemctl mask lvm2-monitor.service
systemctl mask lvm2-lvmpolld.socket
systemctl mask lvm2-lvmpolld.service
systemctl mask lvm2-lvmetad.socket
systemctl mask lvm2-lvmetad.service
systemctl mask lvm2-activation.service
systemctl mask lvm2-activation-early.service

# disable avahi
systemctl disable avahi-daemon
systemctl mask avahi-daemon
systemctl mask avahi-demon.service
systemctl mask avahi-demon.socket
systemctl mask avahi-dconfd.service

# disable usb modems
systemctl mask ModemManager.service

# disanle core dumps
systemctl mask systemd-coredump.socket


# https://unix.stackexchange.com/a/414997/217627
sudo journalctl --flush
sudo rm -rf /var/log/journal
sudo sed -i 's/#Storage=auto/Storage=auto/' /etc/systemd/journald.conf
# reboot

# disable periodic load increase due to man-db.service
sudo systemctl disable man-db.service
sudo systemctl disable man-db.timer
