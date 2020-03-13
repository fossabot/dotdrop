opkg update
opkg list-upgradable
opkg install openvpn-openssl luci-app-openvpn luci-i18n-openvpn-ru libustream-openssl20150806

wget --no-check-certificate "https://zaborona.help/ca.crt" -O /etc/openvpn/ca.crt
wget --no-check-certificate "https://zaborona.help/zaborona-help.crt" -O /etc/openvpn/zaborona-help.crt
wget --no-check-certificate "https://zaborona.help/zaborona-help.key" -O /etc/openvpn/zaborona-help.key
wget --no-check-certificate "https://zaborona.help/zaborona-help.ovpn" -O /etc/openvpn/zaborona-help.ovpn

uci set network.zaborona_help=interface
uci set network.zaborona_help.proto='none'
uci set network.zaborona_help.ifname='tun0'
uci set network.zaborona_help.auto='1'
uci commit network

# Удаляю Default конфиги, чтобы не "мозолили" глаза.
uci delete openvpn.custom_config
uci delete openvpn.sample_server
uci delete openvpn.sample_client

uci set openvpn.zaborona_help=openvpn
uci set openvpn.zaborona_help.client='1'
uci set openvpn.zaborona_help.reneg_sec='0'
uci set openvpn.zaborona_help.verb='0' #убрал логирование по умолчанию — 3
uci set openvpn.zaborona_help.nobind='1'
uci set openvpn.zaborona_help.remote_cert_tls='server'
uci set openvpn.zaborona_help.dev='tun0'
uci set openvpn.zaborona_help.remote='vpn.zaborona.help'
uci set openvpn.zaborona_help.proto='tcp-client'
uci set openvpn.zaborona_help.cipher='AES-128-CBC'
uci set openvpn.zaborona_help.ca='/etc/openvpn/ca.crt'
uci set openvpn.zaborona_help.cert='/etc/openvpn/zaborona-help.crt'
uci set openvpn.zaborona_help.key='/etc/openvpn/zaborona-help.key'
uci set openvpn.zaborona_help.enabled='1'
uci set openvpn.zaborona_help.auth_nocache='1'
uci set openvpn.zaborona_help.pull_filter='ignore ifconfig-ipv6' #отключил поддержку IPv6
uci add_list openvpn.zaborona_help.pull_filter='ignore route-ipv6' #отключил поддержку IPv6

uci commit openvpn
# Обратить внимание если есть pppoe и wan6 интерфейс, то будет 'wan6 pppoe wan zaborona_help'.
# uci set firewall.@zone[1].network='wan zaborona_help'
uci set firewall.@zone[1].network='wan6 pppoe wan zaborona_help'
uci commit firewall

/etc/init.d/openvpn enable
/etc/init.d/openvpn reload
/etc/init.d/firewall reload
/etc/init.d/network reload
