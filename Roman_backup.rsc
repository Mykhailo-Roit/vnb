# oct/23/2021 17:12:42 by RouterOS 6.48.4
# software id = ZJ3M-ESHW
#
#
#
/interface ethernet
set [ find default-name=ether2 ] name=lan
set [ find default-name=ether1 ] name=wan
/ip pool
add name=dhcp_pool0 ranges=10.34.40.1-10.34.40.253
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=lan name=dhcp1
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/ip address
add address=10.34.40.254/24 interface=lan network=10.34.40.0
/ip cloud
set update-time=no
/ip dhcp-client
add disabled=no interface=wan
/ip dhcp-server lease
add address=10.34.40.253 client-id=1:0:c:29:12:7f:5 comment=win19 \
    mac-address=00:0C:29:12:7F:05 server=dhcp1
add address=10.34.40.252 comment=centos mac-address=00:0C:29:17:A0:00 server=\
    dhcp1
add address=10.34.40.251 comment=pbx mac-address=00:0C:29:5F:B3:47 server=\
    dhcp1
/ip dhcp-server network
add address=10.34.40.0/24 dns-server=8.8.8.8 gateway=10.34.40.254
/ip firewall address-list
add address=91.247.89.54 list=whitelist
add address=144.76.100.185 list=whitelist
add address=148.251.26.110 list=whitelist
add address=148.251.79.249 list=whitelist
add address=148.251.122.217 list=whitelist
add address=148.251.91.71 list=whitelist
add address=178.150.132.10 list=whitelist
add address=10.34.1.253 list=whitelist
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
add address=195.140.226.145 list=whitelist
add address=139.180.171.0/24 list=blacklist
add address=185.156.74.0/24 list=blacklist
add address=91.223.67.0/24 list=blacklist
add address=185.193.88.0/24 list=blacklist
add address=185.153.199.0/24 list=blacklist
add address=87.251.75.0/24 list=blacklist
add address=78.128.112.0/24 list=blacklist
add address=94.232.40.0/24 list=blacklist
add address=94.232.43.0/24 list=blacklist
add address=134.249.148.0/24 list=blacklist
add address=178.151.107.0/24 list=blacklist
add address=95.79.55.0/24 list=blacklist
add address=134.209.76.0/24 list=blacklist
add address=178.234.40.0/24 list=blacklist
add address=45.227.253.0/24 list=blacklist
add address=10.34.40.253 list="PBX allowed"
add address=10.34.40.252 list="PBX allowed"
add address=141.98.10.0/24 list=blacklist
add address=212.1.95.0/24 list=blacklist
/ip firewall filter
add action=accept chain=input comment=winbox dst-port=8291 protocol=tcp \
    src-address-list=whitelist
add action=drop chain=input comment="block blacklist" src-address-list=\
    blacklist
add action=accept chain=forward dst-address-list=10.34.40.251 \
    src-address-list="PBX allowed"
add action=drop chain=forward comment="block blacklist" src-address-list=\
    blacklist
add action=drop chain=input comment=Bogon_Wan_Drop in-interface=wan \
    src-address-list=BOGON
add action=add-src-to-address-list address-list=perebor_portov_drop \
    address-list-timeout=12h chain=input comment=Perebor_portov_add_list \
    dst-port=21,23,3389,3399,5080,8291,17000,30000,33488,34488 in-interface=\
    wan log=yes log-prefix=Attack protocol=tcp
add action=drop chain=input comment=Perebor_portov_list_drop in-interface=wan \
    src-address-list=perebor_portov_drop
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
add action=drop chain=input dst-port=53 in-interface=wan protocol=udp
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
    protocol=tcp src-address-list=!whitelist
add action=drop chain=input comment="resist from virus" dst-port=\
    53,135,137-139,445,593,1024-1035,4444,8728,8729 protocol=tcp
add action=drop chain=forward comment="resist from virus" dst-port=\
    135,137-139,445,593,1024-1035,4444 protocol=tcp
add action=drop chain=input comment="resist from virus" dst-port=135,137-139 \
    protocol=udp
add action=drop chain=forward comment="resist from virus" dst-port=\
    135,137-139 protocol=udp
add action=accept chain=forward comment=established connection-state=\
    established
add action=accept chain=forward comment=related connection-state=related
add action=accept chain=input comment=icmp protocol=icmp
add action=accept chain=forward comment=icmp protocol=icmp
add action=accept chain=output comment=gre protocol=gre
add action=drop chain=input comment=invalid connection-state=invalid
add action=drop chain=forward comment=invalid connection-state=invalid
/ip firewall nat
add action=masquerade chain=srcnat out-interface=wan
add action=masquerade chain=srcnat comment="NAT loopback" disabled=yes \
    dst-address=10.34.40.251 dst-port=5060,10000-20000 protocol=udp to-ports=\
    0-65535
add action=src-nat chain=srcnat comment="NAT loopback" dst-port=0-65535 \
    protocol=tcp src-address=10.34.40.0/24 to-addresses=78.46.80.25 to-ports=\
    0-65535
add action=src-nat chain=srcnat comment="NAT loopback" disabled=yes dst-port=\
    0-65535 protocol=udp src-address=10.34.40.0/24 to-addresses=78.46.80.25 \
    to-ports=0-65535
add action=masquerade chain=srcnat comment="NAT loopback" disabled=yes \
    dst-address=10.34.40.252 dst-port=80 protocol=tcp src-address=\
    10.34.40.0/24 to-ports=0
add action=dst-nat chain=dstnat dst-port=34543 in-interface=wan protocol=tcp \
    to-addresses=10.34.40.253 to-ports=3389
add action=dst-nat chain=dstnat comment=CentOS dst-port=34043 in-interface=\
    wan protocol=tcp to-addresses=10.34.40.252 to-ports=80
add action=dst-nat chain=dstnat comment=CentOS dst-port=22 in-interface=wan \
    protocol=tcp to-addresses=10.34.40.252 to-ports=22
add action=dst-nat chain=dstnat comment=CentOS dst-port=80 in-interface=wan \
    protocol=tcp to-addresses=10.34.40.252 to-ports=80
add action=dst-nat chain=dstnat comment=CentOS dst-address=78.46.80.25 \
    dst-port=80 protocol=tcp src-address=10.34.40.253 to-addresses=\
    10.34.40.252 to-ports=80
add action=dst-nat chain=dstnat comment=CentOS dst-address=78.46.80.25 \
    dst-port=443 protocol=tcp src-address=10.34.40.253 to-addresses=\
    10.34.40.252 to-ports=443
add action=dst-nat chain=dstnat comment=CentOS dst-address=78.46.80.25 \
    dst-port=0-65535 protocol=tcp src-address=10.34.40.253 to-addresses=\
    10.34.40.252 to-ports=0-65535
add action=dst-nat chain=dstnat comment=PBX disabled=yes dst-address=\
    78.46.80.25 dst-port=5060 protocol=udp to-addresses=10.34.40.251 \
    to-ports=5060
add action=dst-nat chain=dstnat comment=PBX dst-address=78.46.80.25 dst-port=\
    5060 protocol=udp src-address=10.34.40.252 to-addresses=10.34.40.251 \
    to-ports=5060
add action=dst-nat chain=dstnat comment=PBX disabled=yes dst-address=\
    78.46.80.25 dst-port=10000-20000 protocol=udp to-addresses=10.34.40.251 \
    to-ports=10000-20000
add action=dst-nat chain=dstnat comment=PBX dst-address=78.46.80.25 dst-port=\
    10000-20000 protocol=udp src-address=10.34.40.252 to-addresses=\
    10.34.40.251 to-ports=10000-20000
add action=dst-nat chain=dstnat comment=PBX dst-address=78.46.80.25 dst-port=\
    3322 protocol=tcp src-address=10.34.40.253 to-addresses=10.34.40.251 \
    to-ports=3322
add action=dst-nat chain=dstnat comment=PBX dst-address=78.46.80.25 dst-port=\
    3322 protocol=tcp src-address=10.34.40.252 to-addresses=10.34.40.251 \
    to-ports=3322
add action=dst-nat chain=dstnat comment=PBX dst-address=78.46.80.25 dst-port=\
    8080 protocol=tcp src-address=10.34.40.253 to-addresses=10.34.40.251 \
    to-ports=8080
add action=dst-nat chain=dstnat comment=PBX dst-address=78.46.80.25 dst-port=\
    8080 protocol=tcp src-address=10.34.40.252 to-addresses=10.34.40.251 \
    to-ports=8080
add action=masquerade chain=srcnat dst-address=78.46.80.25 protocol=tcp \
    src-address=10.34.40.253
add action=masquerade chain=srcnat dst-address=78.46.80.25 src-address=\
    10.34.40.252
add action=dst-nat chain=dstnat comment=CentOS dst-port=5222 in-interface=wan \
    protocol=tcp to-addresses=10.34.40.252 to-ports=5222
add action=dst-nat chain=dstnat comment=CentOS dst-port=5223 in-interface=wan \
    protocol=tcp to-addresses=10.34.40.252 to-ports=5223
add action=dst-nat chain=dstnat comment=CentOS dst-port=8890 in-interface=wan \
    protocol=tcp to-addresses=10.34.40.252 to-ports=8890
add action=dst-nat chain=dstnat comment=CentOS dst-port=8891 in-interface=wan \
    protocol=tcp to-addresses=10.34.40.252 to-ports=8891
add action=dst-nat chain=dstnat comment=CentOS dst-port=8893 in-interface=wan \
    protocol=tcp to-addresses=10.34.40.252 to-ports=8893
add action=dst-nat chain=dstnat comment=CentOS dst-port=8894 in-interface=wan \
    protocol=tcp to-addresses=10.34.40.252 to-ports=8894
add action=dst-nat chain=dstnat comment=CentOS dst-port=443 in-interface=wan \
    protocol=tcp to-addresses=10.34.40.252 to-ports=443
add action=dst-nat chain=dstnat comment=PBX dst-port=3322 in-interface=wan \
    protocol=tcp to-addresses=10.34.40.251 to-ports=22
add action=dst-nat chain=dstnat comment=PBX dst-port=8080 in-interface=wan \
    protocol=tcp to-addresses=10.34.40.251 to-ports=80
add action=dst-nat chain=dstnat comment=PBX dst-port=5060 in-interface=wan \
    protocol=udp to-addresses=10.34.40.251 to-ports=5060
add action=dst-nat chain=dstnat comment=PBX dst-port=10000-20000 \
    in-interface=wan protocol=udp to-addresses=10.34.40.251 to-ports=\
    10000-20000
/ip firewall service-port
set sip disabled=yes
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/system clock
set time-zone-autodetect=no time-zone-name=Europe/Kiev
