#!/usr/bin/env bash

sudo systemctl mask lvm2-monitor.service
sudo systemctl mask ModemManager.service

# https://unix.stackexchange.com/a/414997/217627
sudo journalctl --flush
sudo rm -rf /var/log/journal
sudo sed -i 's/#Storage=auto/Storage=auto/' /etc/systemd/journald.conf
# reboot

# disable periodic load increase due to man-db.service
sudo systemctl disable man-db.service
sudo systemctl disable man-db.timer
