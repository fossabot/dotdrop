#!/bin/sh
# openwrt extroot /dev/sda1 ext4  /dev/sda2 swap
# latest version https://downloads.openwrt.org/releases/19.07-SNAPSHOT/targets/ar71xx/generic/

# https://forums.torguard.net/index.php?/topic/499-dd-wrttomatoopenwrtpadavan-route-specific-traffic-around-the-vpn/

opkg update && opkg install kmod-usb-storage kmod-scsi-core block-mount kmod-fs-ext4 kmod-usb-uhci e2fsprogs fdisk

modprobe sd_mod
modprobe usb-storage
modprobe ext4
lsmod | grep -Ei 'sd_mod|usb-storage|ext4'

# mkfs.ext4 -F /dev/sda1 #format ext4
# mkswap /dev/sda2

echo "
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1

# https://forum.openwrt.org/t/fstools-extroot-may-have-a-bug/51743/2
export PREINIT=1
mount_root

exit 0
" > /etc/rc.local


mkdir -p /mnt/sda1 && mount /dev/sda1 /mnt
tar -C /overlay/ -c . -f - | tar -C /mnt/ -xf -

# tar -C /tmp/cproot -cvf - . | tar -C /mnt/sda1 -xf -
# mkdir -p /tmp/cproot && mount --bind / /tmp/cproot
# umount /tmp/cproot

echo "
config 'global'
	option	anon_swap	'0'
	option	anon_mount	'0'
	option	auto_swap	'1'
	option	auto_mount	'1'
	option	delay_root	'5'
	option	check_fs	'0'

config swap
	option device '/dev/sda2'
	option enabled '1'

config mount
	option target '/overlay'
	option device '/dev/sda1'
	option enabled '1'
" > /etc/config/fstab

/etc/init.d/fstab enable
readlink -f /etc/rc.d/*fstab
# reboot


# echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDUZXmK3Owj3TpRIosGPXxgAK+TI/xEMmjrYOyMHcnHTZviPgV/MMoX66up842v0U3C81PtOf5SMc2bCaxegDWIpCVbULWoSnhlVK1wK/XoDwicZE06hKiuACEbfpdnzJjMRM2Z0d5eX755gVIEa0muTOGfm+nima8tu+j5uxXfF6slQgWP634o45L5O85r2ydsmdWdMUMZxR5TmSNGs8OYNIxH7FP3bos8TctlFvT958gdAVn0YqxHfKphs9gEbx+/O0uUQ6rXk2lksf7RSecNl2mZuGzAkcpe3diTLpwXioQ89U2XuJPCFGoUpewq4Hcis1qtEgvfMD+uwP601cYK3kqSWJ15aj05rnu+22Ymu7gEt0KGREpQ9af2QkpRL/8Uvnwv4LZ2jgmRF75+Mn0or0AZykLPhBGiOtwb5hP5B7jLGPpJ/8DGBc0yQ9aCr+8Q5ponKvz2AsmfSJChoRPeUoxk3K45iLChIC6PDfLxLs0xFWnf1zIodr01QaPWwhPdH/mBh3DiNI5iJtcMjSr+6fCU3Y+40SQGj6FtC2xZMoykyV26ei0jBAV7EBkBAjxXMcWhwUKtxCAz4DSFXp5H5pi97dJG7d58ZyJSjYraRqDZu/z9tzzmJcR7IBoQzs/iUBZHDk9Pe4Q0tTZRj/Qelhqx7lisNl8C9fwgOdavQQ== root" > /etc/dropbear/authorized_keys
# ssh root@192.168.1.1 "tee -a /etc/dropbear/authorized_keys" < ~/.ssh/id_rsa.pub

cat << "EOF" > /etc/dropbear/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDUZXmK3Owj3TpRIosGPXxgAK+TI/xEMmjrYOyMHcnHTZviPgV/MMoX66up842v0U3C81PtOf5SMc2bCaxegDWIpCVbULWoSnhlVK1wK/XoDwicZE06hKiuACEbfpdnzJjMRM2Z0d5eX755gVIEa0muTOGfm+nima8tu+j5uxXfF6slQgWP634o45L5O85r2ydsmdWdMUMZxR5TmSNGs8OYNIxH7FP3bos8TctlFvT958gdAVn0YqxHfKphs9gEbx+/O0uUQ6rXk2lksf7RSecNl2mZuGzAkcpe3diTLpwXioQ89U2XuJPCFGoUpewq4Hcis1qtEgvfMD+uwP601cYK3kqSWJ15aj05rnu+22Ymu7gEt0KGREpQ9af2QkpRL/8Uvnwv4LZ2jgmRF75+Mn0or0AZykLPhBGiOtwb5hP5B7jLGPpJ/8DGBc0yQ9aCr+8Q5ponKvz2AsmfSJChoRPeUoxk3K45iLChIC6PDfLxLs0xFWnf1zIodr01QaPWwhPdH/mBh3DiNI5iJtcMjSr+6fCU3Y+40SQGj6FtC2xZMoykyV26ei0jBAV7EBkBAjxXMcWhwUKtxCAz4DSFXp5H5pi97dJG7d58ZyJSjYraRqDZu/z9tzzmJcR7IBoQzs/iUBZHDk9Pe4Q0tTZRj/Qelhqx7lisNl8C9fwgOdavQQ== root
EOF

# after extroot
opkg update
opkg install nano wget curl openssh-sftp-server
opkg install luci-app-https-dns-proxy luci-app-qos wget uclient-fetch libustream-wolfssl20150806


# Config Script
# https://github.com/valdi74/scripts/blob/master/ruter_config/make_config_script.sh
# https://github.com/wulfy23/files-postinstall/blob/master/0-basic/bin/opK
# sysupgrade -c -o -u -k -t -v openwrt-19.07-snapshot-r10841-594f731e04-ar71xx-generic-dir-825-b1-squashfs-sysupgrade.bin
# sysupgrade -c -o -u -v openwrt-19.07-snapshot-r10841-594f731e04-ar71xx-generic-dir-825-b1-squashfs-sysupgrade.bin

echo "
export PS1=\"\[\e[34m\]\w\[\e[m\] \[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[33;40m\]\h\[\e[m\]\[\e[31m\]\n\\❯\[\e[m\] \"
alias o=\"opkg\"
alias ou=\"opkg update\"
alias oua='opkg list-upgradable | sed -e \"s/\s.*//\" | while read PKG_NAME; do opkg upgrade \"${PKG_NAME}\"; done'
alias r=\"source /root/.profile\"
" > /root/.profile
# export PS1="\[\e[34m\]\w\[\e[m\] \[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[33;40m\]\h\[\e[m\]\[\e[31m\]\n\\❯\[\e[m\] "
