#!/usr/bin/env bash

uci set dhcp.lan.ra_management='1'
uci set network.lan.ipaddr='10.0.1.1'

uci set network.wan.proto='pppoe'
uci set network.wan.password='TN3U3Y'
uci set network.wan.ipv6='auto'
uci set network.wan.username='mol049000'

uci set network.wan.peerdns='0'
uci add_list network.wan.dns='1.1.1.1'
uci add_list network.wan.dns='1.0.0.1'

uci set wireless.radio0.disabled='0'
uci set wireless.radio0.noscan='1'
uci set wireless.radio0.htmode='HT40'
uci set wireless.default_radio0.key='67048922'
uci set wireless.default_radio0.ssid='Home Wireless'
uci set wireless.default_radio0.encryption='psk-mixed'

uci set system.cfg01e48a.zonename='Europe/Kiev'
uci set system.cfg01e48a.hostname='wrt'
uci set system.cfg01e48a.log_proto='udp'
uci set system.cfg01e48a.conloglevel='8'
uci set system.cfg01e48a.cronloglevel='5'
uci set system.cfg01e48a.timezone='EET-2EEST,M3.5.0/3,M10.5.0/4'


# uci del dhcp.cfg01411c.resolvfile
# uci del dhcp.cfg01411c.boguspriv
# uci del dhcp.cfg01411c.filterwin2k
# uci del dhcp.cfg01411c.nonegcache
# uci del dhcp.cfg01411c.nonwildcard
uci del dhcp.cfg01411c.domainneeded
uci add dhcp host # =cfg05fe63
uci set dhcp.@host[-1].mac='00:C0:CA:59:7C:21'
uci set dhcp.@host[-1].name='art'
uci set dhcp.@host[-1].dns='1'
uci set dhcp.@host[-1].ip='192.168.1.188'
uci set dhcp.@host[-1].ip='10.0.1.10'
uci add dhcp host # =cfg06fe63
uci set dhcp.@host[-1].mac='44:1E:A1:E6:01:05'
uci set dhcp.@host[-1].name='nb'
uci set dhcp.@host[-1].dns='1'
uci set dhcp.@host[-1].ip='10.0.1.11'

uci set fstab.@mount[0]=mount
uci set fstab.@mount[0].target='/overlay'
uci set fstab.@mount[0].uuid='9cac6b86-3d48-492d-8b6a-79e176dfc537'
uci set fstab.@mount[0].enabled='1'

uci add fstab swap
uci set fstab.@swap[-1].uuid='70452195-33e2-4306-8517-98ac097878c8'
uci set fstab.@swap[-1].enabled='1'
