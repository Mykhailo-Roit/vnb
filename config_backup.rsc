# aug/09/2020 21:05:42 by RouterOS 6.47
# software id = ZJ3M-ESHW
#
#
#
/interface ethernet
set [ find default-name=ether2 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full name=lan
set [ find default-name=ether1 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full mac-address=\
    00:50:56:00:63:61 name=wan
/interface list
add exclude=dynamic name=discover
add name=mactel
add name=mac-winbox
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip ipsec proposal
set [ find default=yes ] enc-algorithms=aes-128-cbc
/ip pool
add name=dhcp ranges=10.34.1.1-10.34.1.253
add name=dhcp_vpn ranges=172.16.16.1-172.16.16.253
/ip dhcp-server
add address-pool=dhcp authoritative=after-2sec-delay disabled=no interface=\
    lan name=dhcp1
/ppp profile
add change-tcp-mss=yes local-address=172.0.0.253 name=vpn_rout_Lance
add address-list=VPN-incoming local-address=172.16.16.254 name=vpn \
    remote-address=dhcp_vpn use-encryption=yes
/interface l2tp-client
add connect-to=37.57.71.111 mrru=1600 name=arbuz_2_lance password=,t#gfh0kz \
    profile=vpn_rout_Lance user=arbuz_2_lance
/queue interface
set lan queue=ethernet-default
set wan queue=ethernet-default
/snmp community
set [ find default=yes ] addresses=0.0.0.0/0
/ip neighbor discovery-settings
set discover-interface-list=discover
/interface l2tp-server server
set enabled=yes
/interface list member
add interface=wan list=discover
add interface=lan list=discover
add interface=lan list=mactel
add interface=lan list=mac-winbox
/interface pptp-server server
set enabled=yes
/ip address
add address=10.34.1.254/24 comment="default configuration" interface=lan \
    network=10.34.1.0
add address=144.76.111.56/27 interface=wan network=144.76.111.32
/ip cloud
set update-time=no
/ip dhcp-server lease
add address=10.34.1.253 client-id=1:0:50:56:9d:7e:87 mac-address=\
    00:50:56:9D:7E:87 server=dhcp1
add address=10.34.1.252 client-id=1:0:50:56:9d:24:fc mac-address=\
    00:50:56:9D:24:FC server=dhcp1
add address=10.34.1.249 client-id=1:0:c:29:28:f5:c0 mac-address=\
    00:0C:29:28:F5:C0 server=dhcp1
add address=10.34.1.248 client-id=1:0:c:29:c9:80:7d mac-address=\
    00:0C:29:C9:80:7D server=dhcp1
/ip dhcp-server network
add address=10.34.1.0/24 dns-server=8.8.8.8 gateway=10.34.1.254
/ip dns
set servers=8.8.8.8
/ip firewall address-list
add address=0.0.0.0/8 list=BOGON
add address=10.0.0.0/8 list=BOGON
add address=100.64.0.0/10 list=BOGON
add address=127.0.0.0/8 list=BOGON
add address=169.254.0.0/16 list=BOGON
add address=172.16.0.0/12 list=BOGON
add address=192.0.0.0/24 list=BOGON
add address=192.0.2.0/24 list=BOGON
add address=192.168.0.0/16 list=BOGON
add address=198.18.0.0/15 list=BOGON
add address=198.51.100.0/24 list=BOGON
add address=203.0.113.0/24 list=BOGON
add address=224.0.0.0/4 list=BOGON
add address=240.0.0.0/4 list=BOGON
add address=185.158.104.92 list=blacklist
add address=176.108.2.121 list=blacklist
add address=159.224.52.96 list=blacklist
add address=156.233.65.52 list=blacklist
add address=216.218.206.110 list=blacklist
add address=77.42.235.82 list=blacklist
add address=91.247.89.54 list=whitelist
add address=148.251.178.176 list=whitelist
add address=144.76.111.56 list=whitelist
add address=148.251.26.110 list=whitelist
add address=148.251.79.249 list=whitelist
add address=176.9.26.252 list=whitelist
add address=10.34.1.253 list=whitelist
add address=10.34.1.248 list=whitelist
add address=92.115.254.187 list=blacklist
add address=5.2.210.187 list=blacklist
add address=5.101.0.0/16 list=blacklist
add address=178.150.132.10 list=whitelist
add address=5.188.0.0/16 list=blacklist
add address=4.53.47.0/24 list=blacklist
add address=1.212.122.108 list=blacklist
add address=62.32.81.84 list=blacklist
add address=196.52.43.0/24 list=blacklist
add address=111.223.73.130 list=blacklist
add address=144.76.100.185 list=whitelist
add address=139.198.121.113 list=blacklist
add address=221.229.166.69 list=blacklist
add address=60.169.25.246 list=blacklist
add address=110.249.212.46 list=blacklist
add address=115.238.245.8 list=blacklist
add address=185.53.0.0/16 list=blacklist
add address=222.186.129.44 list=blacklist
add address=185.254.0.0/16 list=blacklist
add address=222.187.225.11 list=blacklist
add address=193.32.163.89 list=blacklist
add address=14.225.3.37 list=blacklist
add address=45.136.0.0/16 list=blacklist
add address=185.175.93.8 list=blacklist
add address=45.143.0.0/16 list=blacklist
add address=77.247.0.0/16 list=blacklist
add address=93.178.218.0/24 list=blacklist
add address=185.153.0.0/16 list=blacklist
add address=5.9.201.0/24 list=blacklist
add address=85.209.0.0/16 list=blacklist
add address=185.202.0.0/16 list=blacklist
add address=217.147.91.0/24 list=blacklist
add address=79.124.62.0/24 list=blacklist
add address=141.98.83.0/24 list=blacklist
add address=92.119.160.0/24 list=blacklist
add address=92.246.76.0/24 list=blacklist
add address=87.117.247.0/24 list=blacklist
add address=89.144.47.0/24 list=blacklist
add address=85.93.20.0/24 list=blacklist
add address=89.234.196.0/24 list=blacklist
add address=192.99.229.0/24 list=blacklist
add address=62.210.203.0/24 list=blacklist
add address=5.152.223.0/24 list=blacklist
add address=109.245.215.0/24 list=blacklist
add address=78.107.161.0/24 list=blacklist
add address=195.4.137.0/24 list=blacklist
add address=62.210.142.0/24 list=blacklist
add address=180.165.0.0/16 list=blacklist
add address=171.67.70.0/24 list=blacklist
add address=199.19.224.0/24 list=blacklist
add address=198.98.61.0/24 list=blacklist
add address=23.225.172.0/24 list=blacklist
add address=51.159.0.0/16 list=blacklist
add address=77.122.28.178 comment="Lena Arbuz" disabled=yes list=whitelist
add address=159.224.52.214 disabled=yes list=whitelist
add address=61.191.0.0/16 list=blacklist
add address=81.19.214.0/24 list=blacklist
add address=46.201.231.0/24 disabled=yes list=blacklist
add address=95.0.194.0/24 list=blacklist
add address=218.92.0.0/16 list=blacklist
/ip firewall filter
add action=accept chain=input comment=winbox dst-port=8291 protocol=tcp \
    src-address-list=whitelist
add action=drop chain=input comment="block BOGON" in-interface=wan \
    src-address-list=BOGON
add action=drop chain=input comment="block blacklist" src-address-list=\
    blacklist
add action=drop chain=forward comment="block blacklist" src-address-list=\
    blacklist
add action=add-src-to-address-list address-list=perebor_portov_drop \
    address-list-timeout=12h chain=input comment=Perebor_portov_add_list \
    dst-port=21,22,23,80,161,3389,5060,5080,8080,8291,8728,8729,30000 \
    in-interface=wan log=yes log-prefix=Attack protocol=tcp
add action=add-src-to-address-list address-list=perebor_portov_drop \
    address-list-timeout=12h chain=input comment=Perebor_portov_add_list \
    dst-port=5060,5080,16000,17000,19000,30000 in-interface=wan log=yes \
    log-prefix=Attack protocol=udp
add action=drop chain=input comment=Perebor_portov_list_drop in-interface=wan \
    src-address-list=perebor_portov_drop
add action=drop chain=input comment=winbox dst-port=8291 in-interface=wan \
    protocol=tcp
add action=drop chain=input comment=Port_scanner_drop src-address-list=\
    "port scanners"
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2w chain=input in-interface=wan protocol=tcp psd=\
    21,3s,3,1
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2w chain=input in-interface=wan protocol=tcp \
    tcp-flags=fin,!syn,!rst,!psh,!ack,!urg
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2w chain=input in-interface=wan protocol=tcp \
    tcp-flags=fin,syn
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2w chain=input in-interface=wan protocol=tcp \
    tcp-flags=syn,rst
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2w chain=input in-interface=wan protocol=tcp \
    tcp-flags=fin,psh,urg,!syn,!rst,!ack
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2w chain=input in-interface=wan protocol=tcp \
    tcp-flags=fin,syn,rst,psh,ack,urg
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2w chain=input in-interface=wan protocol=tcp \
    tcp-flags=!fin,!syn,!rst,!psh,!ack,!urg
add action=drop chain=input dst-port=443 in-interface=wan protocol=tcp
add action=drop chain=input comment="drop rdp brute forcers" disabled=yes \
    protocol=tcp src-address-list=rdp_blacklist
add action=drop chain=forward comment="drop rdp brute forcers" disabled=yes \
    protocol=tcp src-address-list=rdp_blacklist
add action=add-src-to-address-list address-list=rdp_blacklist \
    address-list-timeout=1d chain=forward connection-state=new dst-port=3389 \
    protocol=tcp src-address-list=rdp_stage3
add action=add-src-to-address-list address-list=rdp_stage3 \
    address-list-timeout=1m chain=forward connection-state=new dst-port=3389 \
    protocol=tcp src-address-list=rdp_stage2
add action=add-src-to-address-list address-list=rdp_stage2 \
    address-list-timeout=1m chain=forward connection-state=new dst-port=3389 \
    protocol=tcp src-address-list=rdp_stage1
add action=add-src-to-address-list address-list=rdp_stage1 \
    address-list-timeout=1m chain=forward connection-state=new dst-port=3389 \
    protocol=tcp
add action=drop chain=input comment=ssh dst-port=53 in-interface=wan \
    protocol=udp
add action=drop chain=input comment="resist from virus" dst-port=\
    53,135,137-139,445,593,1024-1035,4444,8728,8729 protocol=tcp
add action=drop chain=forward comment="resist from virus" dst-port=\
    135,137-139,593,1024-1035,4444 protocol=tcp
add action=drop chain=input comment="resist from virus" dst-port=135,137-139 \
    protocol=udp
add action=drop chain=forward comment="resist from virus" dst-port=\
    135,137-139 protocol=udp
add action=accept chain=forward comment=established connection-state=\
    established
add action=accept chain=forward comment=related connection-state=related
add action=accept chain=forward comment="allow VPN users to RDP" dst-address=\
    10.34.1.253 src-address-list=VPN-incoming
add action=accept chain=forward comment="allow VPN users to RDP" dst-address=\
    10.34.1.248 src-address-list=VPN-incoming
add action=drop chain=forward comment="block VPN users to Inet" dst-address=\
    !172.16.16.0/24 src-address-list=VPN-incoming
add action=accept chain=input comment=icmp protocol=icmp
add action=accept chain=forward comment=icmp protocol=icmp
add action=accept chain=output comment="pptp tcp" protocol=tcp src-port=1723
add action=accept chain=output comment="pptp udp" protocol=udp src-port=1701
add action=accept chain=output comment=gre protocol=gre
add action=drop chain=input disabled=yes
add action=drop chain=input comment=invalid connection-state=invalid
add action=drop chain=forward comment=invalid connection-state=invalid
add action=drop chain=input comment=ssh dst-port=22 in-interface=wan \
    protocol=tcp
/ip firewall nat
add action=masquerade chain=srcnat out-interface=wan
add action=dst-nat chain=dstnat comment="RDP Arbuz" dst-port=33489 protocol=\
    tcp src-address-list=whitelist to-addresses=10.34.1.253 to-ports=3389
add action=dst-nat chain=dstnat comment="RDP Arbuz" dst-port=33490 protocol=\
    tcp src-address-list=whitelist to-addresses=10.34.1.252 to-ports=3389
add action=dst-nat chain=dstnat comment="RDP Arbuz" disabled=yes dst-port=\
    33489 protocol=tcp src-address=91.247.89.54 to-addresses=10.34.1.253 \
    to-ports=3389
add action=dst-nat chain=dstnat comment="RDP Arbuz" disabled=yes dst-port=\
    33489 protocol=tcp to-addresses=10.34.1.253 to-ports=3389
add action=dst-nat chain=dstnat comment="RDP Arbuz office Somovskaya" \
    dst-port=33489 protocol=tcp src-address=46.201.231.221 to-addresses=\
    10.34.1.253 to-ports=3389
add action=dst-nat chain=dstnat dst-port=35489 protocol=tcp to-addresses=\
    10.34.1.249 to-ports=3389
add action=dst-nat chain=dstnat disabled=yes dst-port=34589 protocol=tcp \
    to-addresses=10.34.1.248 to-ports=3389
add action=dst-nat chain=dstnat comment="RDP Andrey" dst-port=34489 protocol=\
    tcp src-address-list=whitelist to-addresses=10.34.1.248 to-ports=3389
add action=dst-nat chain=dstnat comment="RDP Andrey" disabled=yes dst-port=\
    34489 protocol=tcp to-addresses=10.34.1.248 to-ports=3389
add action=dst-nat chain=dstnat comment="RDP Andrey" dst-port=34489 protocol=\
    tcp src-address=91.247.89.54 to-addresses=10.34.1.248 to-ports=3389
add action=dst-nat chain=dstnat comment="For connect to ESXi" dst-port=443 \
    protocol=tcp src-address=148.251.79.249 to-addresses=144.76.111.39 \
    to-ports=443
add action=dst-nat chain=dstnat comment="For connect to ESXi" dst-port=443 \
    protocol=tcp src-address=195.144.14.105 to-addresses=144.76.111.39 \
    to-ports=443
add action=dst-nat chain=dstnat comment="For connect to ESXi" dst-port=902 \
    protocol=tcp src-address=148.251.79.249 to-addresses=144.76.111.39 \
    to-ports=902
add action=dst-nat chain=dstnat comment="For connect to ESXi" dst-port=902 \
    protocol=tcp src-address=195.144.14.105 to-addresses=144.76.111.39 \
    to-ports=902
add action=dst-nat chain=dstnat comment="For connect to ESXi" dst-port=903 \
    protocol=tcp src-address=148.251.79.249 to-addresses=144.76.111.39 \
    to-ports=903
add action=dst-nat chain=dstnat comment="For connect to ESXi" dst-port=427 \
    protocol=udp src-address=148.251.79.249 to-addresses=144.76.111.39 \
    to-ports=427
add action=dst-nat chain=dstnat dst-port=3421 protocol=tcp to-addresses=\
    10.34.1.248 to-ports=21
add action=masquerade chain=srcnat disabled=yes dst-address=10.34.1.250 \
    src-address=10.100.0.0/24
add action=dst-nat chain=dstnat comment="for VPN to RDP" dst-address=\
    172.16.16.254 dst-port=33489 protocol=tcp to-addresses=10.34.1.253 \
    to-ports=3389
add action=dst-nat chain=dstnat comment="for VPN to RDP" dst-address=\
    172.16.16.254 dst-port=3399 protocol=tcp to-addresses=10.34.1.248 \
    to-ports=3389
add action=masquerade chain=srcnat dst-address=192.168.11.0/24 src-address=\
    10.34.1.0/24
add action=dst-nat chain=dstnat dst-address=10.34.1.254 dst-port=8211 \
    protocol=tcp to-addresses=172.0.0.11 to-ports=8291
add action=masquerade chain=srcnat dst-address=172.0.0.0/24 src-address=\
    !172.0.0.0/24
/ip route
add distance=1 gateway=144.76.111.33
add distance=1 dst-address=10.100.0.0/24 gateway=172.0.0.254
add distance=1 dst-address=192.168.2.0/24 gateway=172.0.0.2
add check-gateway=ping distance=1 dst-address=192.168.3.0/24 gateway=\
    172.0.0.3
add distance=1 dst-address=192.168.4.0/24 gateway=172.0.0.4
add distance=1 dst-address=192.168.5.0/24 gateway=172.0.0.5
add distance=1 dst-address=192.168.6.0/24 gateway=172.0.0.6
add distance=1 dst-address=192.168.7.0/24 gateway=172.0.0.7
add distance=1 dst-address=192.168.8.0/24 gateway=172.0.0.8
add distance=1 dst-address=192.168.9.0/24 gateway=172.0.0.9
add distance=1 dst-address=192.168.10.0/24 gateway=172.0.0.10
add distance=1 dst-address=192.168.11.0/24 gateway=172.0.0.11
add distance=1 dst-address=192.168.12.0/24 gateway=172.0.0.12
add distance=1 dst-address=192.168.13.0/24 gateway=172.0.0.13
add distance=1 dst-address=192.168.14.0/24 gateway=172.0.0.14
add distance=1 dst-address=192.168.16.0/24 gateway=172.0.0.16
add distance=1 dst-address=192.168.18.0/24 gateway=172.0.0.18
add distance=1 dst-address=192.168.19.0/24 gateway=172.0.0.19
add distance=1 dst-address=192.168.20.0/24 gateway=172.0.0.20
add distance=1 dst-address=192.168.21.0/24 gateway=172.0.0.21
add distance=1 dst-address=192.168.23.0/24 gateway=172.0.0.23
add distance=1 dst-address=192.168.24.0/24 gateway=172.0.0.24
/ip route rule
add action=unreachable dst-address=10.34.1.248/32 src-address=10.34.1.0/24
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/ip socks
set port=4153
/ip ssh
set allow-none-crypto=yes forwarding-enabled=remote
/ppp secret
add name=vnb password=123987456 profile=vpn
add name=magaz7 password=7f123987456 profile=vpn_rout_Lance
add name=magaz6 password=b123987456 profile=vpn_rout_Lance
add name=magaz5 password=p123987456 profile=vpn_rout_Lance
add name=magaz4 password=ch123987456 profile=vpn_rout_Lance
add name=magaz3 password=123987456 profile=vpn_rout_Lance
add name=magaz8 password=8b123987456 profile=vpn_rout_Lance
add name=magaz2 password=123987456 profile=vpn_rout_Lance
add name=magaz9 password=9k123987456 profile=vpn_rout_Lance
add name=magaz10 password=123987456 profile=vpn_rout_Lance
add name=magaz11 password=11k123987456 profile=vpn_rout_Lance
add name=magaz15 password=SMKKolb profile=vpn_rout_Lance routes=\
    192.168.15.0/24
add name=Andrey password=Pass159753 profile=vpn
add name=magaz12 password=a123987456 profile=vpn_rout_Lance
add name=magaz14 password=123987456 profile=vpn_rout_Lance
add name=quest password=Pass159753 profile=vpn
add name=magaz16 password=123987456 profile=vpn_rout_Lance
add name=office17 password=123987456 profile=vpn_rout_Lance routes=\
    192.168.17.0/24
add disabled=yes name=video password=ArbuzzubrA profile=vpn
add disabled=yes name=video1 password=ArbuzzubrA profile=vpn
add disabled=yes name=TabletA password=ArbuzzubrA1 profile=vpn
add disabled=yes name=Tablet2 password=ArbuzzubrA1 profile=vpn
add disabled=yes name=video3 password=ArbuzzubrA profile=vpn
add name=magaz18 password=a123987456 profile=vpn_rout_Lance
add disabled=yes name=NatashaA password=Arbuz123 profile=vpn
add name=pekar19 password=p123987456 profile=vpn_rout_Lance
add name=Victoriya password=Arbuz159Arbuz profile=vpn
add name=magaz20 password=20t123987456 profile=vpn_rout_Lance
add name=Mishanya password=Mihaaalich profile=vpn
add name=magaz21 password=21k123987456 profile=vpn_rout_Lance
add name=office23 password=no123987456 profile=vpn_rout_Lance
add name=kladovshik password=Mercury753 profile=vpn
add name=magaz24 password=Rud123987456 profile=vpn_rout_Lance
add name=magaz13 password=s123987456 profile=vpn_rout_Lance
/system clock
set time-zone-name=Europe/Kiev
/system identity
set name=arbuz
/tool mac-server
set allowed-interface-list=mactel
/tool mac-server mac-winbox
set allowed-interface-list=mac-winbox
/tool mac-server ping
set enabled=no
/tool romon
set enabled=yes secrets=123
/tool romon port
add
