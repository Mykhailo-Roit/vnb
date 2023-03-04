# mar/04/2023 09:34:47 by RouterOS 6.49.7
# software id = ZJ3M-ESHW
#
#
#
/interface ethernet
set [ find default-name=ether2 ] name=lan
set [ find default-name=ether1 ] name=wan
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=10.34.7.1-10.34.7.253
add name=vpn-local ranges=10.34.7.100-10.34.7.150
add name=dhcp_vpn ranges=172.16.16.1-172.16.16.253
/ip dhcp-server
add address-pool=dhcp_pool0 authoritative=after-2sec-delay disabled=no \
    interface=lan lease-time=1h name=dhcp1
/ppp profile
add change-tcp-mss=yes local-address=vpn-local name=l2tp remote-address=\
    vpn-local
add local-address=172.16.16.254 name=vpn remote-address=dhcp_vpn
add address-list=pptp-local local-address=10.34.7.254 name=vpn-local \
    remote-address=vpn-local
add change-tcp-mss=yes local-address=172.0.0.253 name=vpn_rout
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/interface l2tp-server server
set authentication=mschap2 default-profile=l2tp enabled=yes
/ip address
add address=10.34.7.254/24 interface=lan network=10.34.7.0
/ip cloud
set update-time=no
/ip dhcp-client
add disabled=no interface=wan
/ip dhcp-server lease
add address=10.34.7.252 client-id=1:0:c:29:c7:62:70 mac-address=\
    00:0C:29:C7:62:70 server=dhcp1
add address=10.34.7.253 client-id=1:0:c:29:a8:b3:93 mac-address=\
    00:0C:29:A8:B3:93 server=dhcp1
add address=10.34.7.250 client-id=1:0:c:29:b7:1e:99 mac-address=\
    00:0C:29:B7:1E:99 server=dhcp1
add address=10.34.7.249 client-id=1:0:c:29:c9:f0:b3 mac-address=\
    00:0C:29:C9:F0:B3 server=dhcp1
add address=10.34.7.251 client-id=1:0:c:29:38:9d:1c mac-address=\
    00:0C:29:38:9D:1C server=dhcp1
add address=10.34.7.248 client-id=1:0:c:29:68:57:be mac-address=\
    00:0C:29:68:57:BE server=dhcp1
add address=10.34.7.247 client-id=1:0:c:29:61:67:a8 comment=May mac-address=\
    00:0C:29:61:67:A8 server=dhcp1
add address=10.34.7.246 client-id=1:0:c:29:1d:70:8b mac-address=\
    00:0C:29:1D:70:8B server=dhcp1
add address=10.34.7.245 client-id=1:0:c:29:34:44:a mac-address=\
    00:0C:29:34:44:0A server=dhcp1
add address=10.34.7.243 client-id=1:0:c:29:f2:65:14 mac-address=\
    00:0C:29:F2:65:14 server=dhcp1
/ip dhcp-server network
add address=10.34.7.0/24 dns-server=10.34.7.254 gateway=10.34.7.254
/ip dns
set allow-remote-requests=yes servers=8.8.8.8
/ip firewall address-list
add address=195.144.14.105 list=whitelist
add address=78.46.80.25 list=whitelist
add address=148.251.26.110 list=whitelist
add address=148.251.79.249 list=whitelist
add address=176.9.26.252 list=whitelist
add address=148.251.178.176 list=whitelist
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
add address=109.87.105.6 list=whitelist
add address=104.18.212.49 list=blacklist
add address=217.21.193.20 list=blacklist
add address=194.186.195.54 list=blacklist
add address=185.209.0.0/24 list=blacklist
add address=92.246.76.83 list=blacklist
add address=92.119.160.169 list=blacklist
add address=45.136.0.0/16 list=blacklist
add address=92.63.194.37 list=blacklist
add address=45.141.84.0/24 list=blacklist
add address=85.93.20.170 list=blacklist
add address=185.156.0.0/16 list=blacklist
add address=185.137.0.0/16 list=blacklist
add address=185.175.0.0/16 list=blacklist
add address=51.15.17.41 list=blacklist
add address=92.63.194.33 list=blacklist
add address=77.247.0.0/16 list=blacklist
add address=92.63.194.0/24 list=blacklist
add address=51.159.21.95 list=blacklist
add address=163.172.71.5 list=blacklist
add address=5.188.206.166 list=blacklist
add address=185.153.0.0/16 list=blacklist
add address=193.32.161.0/24 list=blacklist
add address=93.178.218.0/24 list=blacklist
add address=69.64.55.103 list=blacklist
add address=62.133.173.245 list=blacklist
add address=45.143.200.4 list=blacklist
add address=202.102.67.0/24 list=blacklist
add address=5.9.201.0/24 list=blacklist
add address=88.99.70.0/24 list=blacklist
add address=95.216.68.0/24 list=blacklist
add address=61.191.50.0/24 list=blacklist
add address=194.61.0.0/16 list=blacklist
add address=54.190.87.11 list=blacklist
add address=188.162.65.0/24 disabled=yes list=blacklist
add address=213.170.74.0/24 disabled=yes list=blacklist
add address=92.246.76.198 list=blacklist
add address=54.81.119.0/24 list=blacklist
add address=193.188.0.0/16 list=blacklist
add address=176.32.184.0/24 disabled=yes list=blacklist
add address=92.246.0.0/16 list=blacklist
add address=83.97.20.0/24 list=blacklist
add address=62.210.188.0/24 list=blacklist
add address=51.159.20.0/24 list=blacklist
add address=76.164.234.0/24 list=blacklist
add address=68.129.202.154 list=blacklist
add address=52.23.224.231 list=blacklist
add address=34.0.0.0/8 list=blacklist
add address=13.52.0.0/16 list=blacklist
add address=3.14.134.0/24 list=blacklist
add address=85.209.0.0/16 list=blacklist
add address=13.58.236.137 list=blacklist
add address=163.172.52.222 list=blacklist
add address=185.202.0.0/16 list=blacklist
add address=89.144.47.0/24 list=blacklist
add address=79.124.62.0/24 list=blacklist
add address=119.75.44.0/24 list=blacklist
add address=194.32.86.0/24 list=blacklist
add address=91.210.118.0/24 list=blacklist
add address=124.0.0.0/8 list=blacklist
add address=141.98.83.0/24 list=blacklist
add address=62.210.203.0/24 list=blacklist
add address=5.152.223.0/24 list=blacklist
add address=109.245.215.0/24 list=blacklist
add address=195.4.137.0/24 list=blacklist
add address=78.107.161.0/24 list=blacklist
add address=62.210.142.0/24 list=blacklist
add address=198.98.61.0/24 list=blacklist
add address=199.19.224.0/24 list=blacklist
add address=171.67.70.0/24 list=blacklist
add address=222.186.15.0/24 list=blacklist
add address=23.225.172.0/24 list=blacklist
add address=92.124.128.0/24 list=blacklist
add address=95.161.184.0/24 list=blacklist
add address=134.17.94.0/24 list=blacklist
add address=46.52.211.0/24 list=blacklist
add address=180.166.141.0/24 list=blacklist
add address=148.251.77.126 list=blacklist
add address=146.120.178.0/24 list=blacklist
add address=138.201.123.0/24 list=blacklist
add address=95.216.16.0/24 list=blacklist
add address=200.233.3.0/24 list=blacklist
add address=116.202.33.0/24 list=blacklist
add address=195.60.225.0/24 list=blacklist
add address=92.81.150.0/24 list=blacklist
add address=87.76.9.0/24 list=blacklist
add address=185.170.184.0/24 list=blacklist
add address=180.211.137.0/24 list=blacklist
add address=81.19.214.0/24 list=blacklist
add address=95.217.119.0/24 list=blacklist
add address=179.107.47.0/24 list=blacklist
add address=5.9.184.0/24 list=blacklist
add address=195.54.0.0/16 list=blacklist
add address=194.186.143.0/24 list=blacklist
add address=43.240.103.0/24 list=blacklist
add address=81.171.29.0/24 list=blacklist
add address=185.10.52.0/24 list=blacklist
add address=94.102.49.0/24 list=blacklist
add address=176.113.115.0/24 list=blacklist
add address=195.4.141.0/24 list=blacklist
add address=185.91.83.0/24 list=blacklist
add address=186.215.199.0/24 list=blacklist
add address=198.0.0.0/24 list=blacklist
add address=213.170.88.0/24 list=blacklist
add address=200.152.119.0/24 list=blacklist
add address=80.82.77.0/24 list=blacklist
add address=27.147.141.0/24 list=blacklist
add address=91.238.20.0/24 list=blacklist
add address=46.98.251.0/24 list=blacklist
add address=79.124.8.0/24 list=blacklist
add address=91.241.19.0/24 list=blacklist
add address=31.131.251.0/24 list=blacklist
add address=193.27.228.0/24 list=blacklist
add address=212.92.101.0/24 list=blacklist
add address=41.231.8.0/24 list=blacklist
add address=95.216.74.0/24 list=blacklist
add address=217.63.114.0/24 list=blacklist
add address=45.141.87.0/24 list=blacklist
add address=80.82.0.0/16 list=blacklist
add address=144.76.0.0/24 list=blacklist
add address=45.145.0.0/16 list=blacklist
add address=93.174.93.0/24 list=blacklist
add address=185.39.0.0/16 list=blacklist
add address=213.217.1.0/24 list=blacklist
add address=193.27.229.0/24 list=blacklist
add address=148.251.152.0/24 list=blacklist
add address=94.232.0.0/16 list=blacklist
add address=94.43.92.0/24 list=blacklist
add address=89.248.0.0/16 list=blacklist
add address=152.89.16.0/24 list=blacklist
add address=103.139.0.0/16 list=blacklist
add address=94.102.50.0/24 list=blacklist
add address=87.251.75.0/24 list=blacklist
add address=171.0.0.0/8 list=blacklist
add address=87.251.67.0/24 list=blacklist
add address=85.93.20.0/24 list=blacklist
add address=185.216.0.0/16 list=blacklist
add address=185.216.140.0/24 list=blacklist
add address=103.195.101.0/24 list=blacklist
add address=45.146.0.0/16 list=blacklist
add address=194.26.29.0/26 list=blacklist
add address=185.193.0.0/16 list=blacklist
add address=167.99.0.0/16 list=blacklist
add address=51.136.96.0/24 list=blacklist
add address=40.113.90.0/24 list=blacklist
add address=194.88.219.0/24 list=blacklist
add address=157.90.0.0/16 list=blacklist
add address=193.29.13.0/24 list=blacklist
add address=116.202.130.0/24 list=blacklist
add address=62.171.183.0/24 list=blacklist
add address=78.128.112.0/24 list=blacklist
add address=194.26.29.0/24 list=blacklist
add address=91.223.67.0/24 list=blacklist
add address=193.106.99.0/24 list=blacklist
add address=5.61.53.0/24 list=blacklist
add address=5.45.72.0/24 list=blacklist
add address=5.182.209.0/24 list=blacklist
add address=45.129.230.0/24 list=blacklist
add address=134.249.148.0/24 list=blacklist
add address=178.151.107.0/24 list=blacklist
add address=95.79.55.0/24 list=blacklist
add address=218.93.208.0/24 list=blacklist
add address=222.187.232.0/24 list=blacklist
add address=178.234.40.0/24 list=blacklist
add address=78.142.18.0/24 list=blacklist
add address=212.1.95.0/24 list=blacklist
add address=5.9.158.0/24 list=blacklist
add address=162.55.130.0/24 list=blacklist
add address=195.201.192.0/24 list=blacklist
add address=80.94.93.0/24 list=blacklist
add address=45.227.254.0/24 list=blacklist
add address=141.94.175.0/24 list=blacklist
add address=51.210.158.0/24 list=blacklist
add address=141.94.169.0/24 list=blacklist
add address=212.34.229.0/24 list=blacklist
add address=80.84.176.0/24 list=blacklist
add address=81.23.117.0/24 list=blacklist
add address=188.187.60.0/24 list=blacklist
add address=148.251.180.0/24 list=blacklist
add address=45.134.26.0/24 list=blacklist
add address=173.12.122.0/24 list=blacklist
add address=85.95.150.0/24 list=blacklist
add address=85.214.90.0/24 list=blacklist
add address=85.29.161.0/24 list=blacklist
add address=84.204.91.0/24 list=blacklist
add address=45.9.20.0/24 list=blacklist
add address=85.214.245.0/24 list=blacklist
add address=109.106.1.0/24 list=blacklist
add address=45.155.0.0/16 list=blacklist
add address=188.166.211.0/24 list=blacklist
add address=109.167.224.0/24 list=blacklist
add address=46.146.0.0/16 list=blacklist
add address=109.194.0.0/16 list=blacklist
add address=5.188.65.0/24 list=blacklist
add address=78.29.27.0/24 list=blacklist
add address=95.181.128.0/24 list=blacklist
add address=46.4.205.0/24 list=blacklist
add address=134.249.168.0/24 list=blacklist
add address=193.107.170.0/24 list=blacklist
add address=109.230.226.0/24 list=blacklist
add address=46.4.102.0/24 list=blacklist
add address=188.40.71.0/24 list=blacklist
add address=134.249.186.0/24 list=blacklist
add address=87.103.133.0/24 list=blacklist
add address=185.219.52.0/24 list=blacklist
add address=89.218.142.0/24 list=blacklist
add address=212.98.173.0/24 list=blacklist
add address=45.143.203.0/24 list=blacklist
add address=92.255.85.0/24 list=blacklist
add address=193.34.10.0/24 list=blacklist
add address=193.106.191.0/24 list=blacklist
add address=37.193.67.0/24 list=blacklist
add address=62.233.50.0/24 list=blacklist
add address=87.251.64.0/24 list=blacklist
add address=129.150.99.0/24 list=blacklist
add address=142.132.151.0/24 list=blacklist
add address=168.119.211.0/24 list=blacklist
add address=123.51.167.0/24 list=blacklist
add address=176.120.100.0/24 list=blacklist
add address=62.33.244.0/24 list=blacklist
add address=144.76.81.0/24 list=blacklist
add address=188.170.52.0/24 list=blacklist
add address=77.121.82.0/24 list=blacklist
add address=93.183.214.0/24 list=blacklist
add address=194.183.183.0/24 list=blacklist
add address=168.119.209.0/24 list=blacklist
add address=136.243.43.0/24 list=blacklist
add address=93.84.82.0/24 list=blacklist
add address=118.68.218.0/24 list=blacklist
add address=5.180.187.0/24 list=blacklist
add address=89.252.190.0/24 list=blacklist
add address=90.160.27.0/24 list=blacklist
add address=103.16.222.0/24 list=blacklist
add address=94.16.108.0/24 list=blacklist
add address=88.99.92.0/24 list=blacklist
add address=136.243.3.0/24 list=blacklist
add address=195.96.65.0/24 list=blacklist
add address=176.9.119.0/24 list=blacklist
add address=144.76.69.0/24 list=blacklist
add address=85.90.218.0/24 disabled=yes list=blacklist
add address=194.26.229.0/24 list=blacklist
add address=188.162.230.0/24 list=blacklist
add address=181.226.0.0/16 list=blacklist
add address=178.136.244.0/24 list=blacklist
add address=45.148.10.0/24 list=blacklist
add address=103.178.236.0/24 list=blacklist
add address=147.78.47.0/24 list=blacklist
add address=91.191.209.0/24 list=blacklist
add address=103.112.0.0/16 list=blacklist
add address=103.16.25.0/24 list=blacklist
add address=103.0.0.0/8 list=blacklist
add address=80.66.88.0/24 list=blacklist
add address=45.41.241.0/24 list=blacklist
add address=166.0.224.0/24 list=blacklist
add address=195.133.20.0/24 list=blacklist
add address=51.159.103.0/24 list=blacklist
add address=93.158.228.0/24 list=blacklist
add address=141.98.10.0/24 list=blacklist
add address=193.110.107.0/24 list=blacklist
add address=20.237.24.0/24 list=blacklist
add address=5.188.206.0/24 list=blacklist
add address=185.170.8.0/24 list=blacklist
add address=82.204.183.0/24 list=blacklist
add address=141.98.9.0/24 list=blacklist
add address=45.227.255.0/24 list=blacklist
add address=176.111.174.0/24 list=blacklist
add address=5.164.218.0/24 disabled=yes list=blacklist
add address=91.240.118.0/24 list=blacklist
add address=79.143.41.0/24 list=blacklist
add address=125.133.0.0/24 list=blacklist
add address=65.109.85.0/24 list=blacklist
add address=135.148.118.0/24 list=blacklist
add address=65.109.83.0/24 list=blacklist
add address=119.17.200.0/24 list=blacklist
add address=125.212.226.0/24 list=blacklist
add address=85.92.117.0/24 list=blacklist
add address=118.182.18.0/24 list=blacklist
add address=31.43.185.0/24 list=blacklist
add address=20.169.145.0/24 list=blacklist
add address=46.98.5.0/24 list=blacklist
add address=20.245.74.0/24 list=blacklist
add address=52.188.1.0/24 list=blacklist
add address=172.173.152.0/24 list=blacklist
add address=20.124.200.0/24 list=blacklist
add address=195.138.83.0/24 list=blacklist
add address=172.174.99.0/24 list=blacklist
add address=20.169.0.0/16 list=blacklist
add address=20.231.90.0/24 list=blacklist
add address=154.12.252.0/24 list=blacklist
add address=193.202.118.112 list=whitelist
add address=174.138.185.0/24 list=blacklist
add address=61.244.212.0/24 list=blacklist
add address=81.209.147.0/24 list=blacklist
add address=51.255.20.0/24 list=blacklist
add address=68.178.163.0/24 list=blacklist
add address=179.43.177.0/24 list=blacklist
add address=20.141.0.0/16 list=blacklist
add address=172.173.0.0/16 list=blacklist
add address=38.96.139.0/24 list=blacklist
add address=162.142.125.0/24 list=blacklist
add address=52.186.161.0/24 list=blacklist
add address=4.227.0.0/16 list=blacklist
add address=20.231.0.0/16 list=blacklist
add address=93.76.179.0 list=whitelist
add address=20.0.0.0/8 list=blacklist
add address=40.115.208.0/24 list=blacklist
add address=172.174.0.0/16 list=blacklist
add address=4.246.0.0/16 list=blacklist
add address=185.73.124.0/24 list=blacklist
add address=154.89.5.0/24 list=blacklist
add address=4.193.0.0/16 list=blacklist
add address=4.133.0.0/16 list=blacklist
add address=4.233.0.0/16 list=blacklist
add address=46.219.126.0/24 list=blacklist
add address=66.181.165.0/24 list=blacklist
add address=31.130.192.0/24 list=blacklist
add address=95.217.29.118 comment="Misha !!!" list=whitelist
add address=79.124.58.0/24 list=blacklist
add address=79.124.49.0/24 list=blacklist
add address=193.142.146.0/24 list=blacklist
add address=78.128.114.0/24 list=blacklist
add address=142.132.213.0/24 list=blacklist
/ip firewall filter
add action=accept chain=input comment="!!! delete" disabled=yes dst-port=8291 \
    protocol=tcp
add action=accept chain=input dst-port=8291 protocol=tcp src-address-list=\
    whitelist
add action=drop chain=input comment=Bogon_Wan_Drop in-interface=wan \
    src-address-list=BOGON
add action=drop chain=input comment="block blacklist" src-address-list=\
    blacklist
add action=drop chain=forward comment="block blacklist" src-address-list=\
    blacklist
add action=add-src-to-address-list address-list=perebor_portov_drop \
    address-list-timeout=1d chain=input comment=Perebor_portov_add_list \
    dst-port=21,22,23,80,161,3389,5060,5080,8291,8728,8729,30000 \
    in-interface=wan log=yes log-prefix=Attack protocol=tcp
add action=add-src-to-address-list address-list=perebor_portov_drop \
    address-list-timeout=4w3d chain=input comment=Perebor_portov_add_list \
    disabled=yes dst-port=3499 in-interface=wan log=yes log-prefix=Attack \
    protocol=tcp src-address-list=!whitelist
add action=add-src-to-address-list address-list=perebor_portov_drop \
    address-list-timeout=4w3d chain=input comment=Perebor_portov_add_list \
    dst-port=3499 in-interface=wan log=yes log-prefix=Attack protocol=tcp \
    src-address-list=perebor_portov_drop
add action=add-src-to-address-list address-list=perebor_portov_drop \
    address-list-timeout=12h chain=input comment=Perebor_portov_add_list \
    dst-port=5060,5080 in-interface=wan log=yes log-prefix=Attack protocol=\
    udp
add action=drop chain=input comment=Perebor_portov_list_drop in-interface=wan \
    src-address-list=perebor_portov_drop
add action=drop chain=forward comment=Perebor_portov_list_drop in-interface=\
    wan src-address-list=perebor_portov_drop
add action=accept chain=input comment="Allow DNS from lan" dst-port=53 \
    in-interface=lan protocol=udp
add action=accept chain=forward disabled=yes dst-port=53 protocol=udp
add action=drop chain=input comment="drop 53 port" dst-port=53 in-interface=\
    wan protocol=udp
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
add action=drop chain=input comment="resist from virus" dst-port=\
    53,135,137-139,445,593,1024-1035,4444,8728,8729 protocol=tcp
add action=drop chain=forward comment="resist from virus" dst-port=\
    135,137-139,593,1024-1035,4444 protocol=tcp
add action=drop chain=input comment="resist from virus" dst-port=135,137-139 \
    protocol=udp
add action=drop chain=forward comment="resist from virus" dst-port=\
    135,137-139 protocol=udp
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
add action=accept chain=input in-interface=lan protocol=tcp
add action=accept chain=input protocol=icmp
add action=accept chain=forward protocol=icmp
add action=accept chain=input comment="related, establised" connection-state=\
    established,related
add action=accept chain=output comment="pptp udp" protocol=tcp src-port=1723
add action=accept chain=output comment="pptp tcp" protocol=udp src-port=1701
add action=accept chain=input comment=l2tp dst-port=1701,500,4500 \
    in-interface=wan protocol=udp
add action=accept chain=input comment=gre protocol=gre
add action=accept chain=output comment=gre protocol=gre
add action=accept chain=forward dst-address=192.168.45.2
add action=drop chain=input comment=invalid connection-state=invalid
add action=drop chain=forward comment=invalid connection-state=invalid
add action=drop chain=input
add action=drop chain=input comment="drop rdp brute forcers" disabled=yes \
    protocol=tcp src-address-list=rdp_blacklist
/ip firewall nat
add action=masquerade chain=srcnat out-interface=wan
add action=masquerade chain=srcnat comment="vpn masq" out-interface=all-ppp
add action=dst-nat chain=dstnat dst-port=33489 in-interface=wan protocol=tcp \
    to-addresses=10.34.7.252 to-ports=3389
add action=dst-nat chain=dstnat comment=web disabled=yes dst-port=3380 \
    in-interface=wan protocol=tcp to-addresses=10.34.7.252 to-ports=80
add action=dst-nat chain=dstnat comment=pvs dst-port=3799 in-interface=wan \
    protocol=tcp src-address-list=!perebor_portov_drop to-addresses=\
    10.34.7.246 to-ports=3389
add action=dst-nat chain=dstnat comment="Vladymyr 22" dst-port=3799 \
    in-interface=wan protocol=tcp src-address-list=whitelist to-addresses=\
    10.34.7.246 to-ports=3389
add action=dst-nat chain=dstnat comment=Meat dst-port=34999 in-interface=wan \
    protocol=tcp src-address-list=whitelist to-addresses=10.34.7.245 \
    to-ports=3389
add action=dst-nat chain=dstnat comment=May dst-port=33099 in-interface=wan \
    protocol=tcp to-addresses=10.34.7.247 to-ports=3389
add action=dst-nat chain=dstnat comment=2019 dst-port=34543 in-interface=wan \
    protocol=tcp to-addresses=10.34.7.251 to-ports=3389
add action=dst-nat chain=dstnat comment=Pekarnya dst-port=33033 in-interface=\
    wan protocol=tcp to-addresses=10.34.7.243 to-ports=3389
add action=dst-nat chain=dstnat comment=LoskInstr dst-port=35034 \
    in-interface=wan protocol=tcp to-addresses=10.34.7.149 to-ports=3389
add action=dst-nat chain=dstnat comment=LoskInstr dst-port=8080 in-interface=\
    wan log=yes protocol=tcp to-addresses=10.34.7.249 to-ports=8080
add action=dst-nat chain=dstnat comment=LoskInstr dst-port=1080 in-interface=\
    wan protocol=tcp to-addresses=10.34.7.249 to-ports=1080
add action=dst-nat chain=dstnat comment=LoskInstr dst-port=1081 in-interface=\
    wan protocol=tcp to-addresses=10.34.7.249 to-ports=1081
add action=dst-nat chain=dstnat comment=LoskInstr dst-port=443 in-interface=\
    wan log=yes protocol=tcp to-addresses=10.34.7.249 to-ports=443
add action=masquerade chain=srcnat dst-address=192.168.45.2
add action=masquerade chain=srcnat dst-address=192.168.45.3
add action=dst-nat chain=dstnat dst-port=35035 in-interface=wan protocol=tcp \
    to-addresses=192.168.45.3 to-ports=3389
add action=dst-nat chain=dstnat comment=MailServ dst-port=25 in-interface=wan \
    protocol=tcp to-addresses=10.34.7.248 to-ports=25
add action=dst-nat chain=dstnat comment=MailServ disabled=yes dst-port=80,443 \
    in-interface=wan protocol=tcp to-addresses=10.34.7.248
add action=dst-nat chain=dstnat comment=MailServ dst-port=465 in-interface=\
    wan protocol=tcp to-addresses=10.34.7.248
add action=dst-nat chain=dstnat comment=MailServ dst-port=143 in-interface=\
    wan protocol=tcp to-addresses=10.34.7.248 to-ports=143
add action=dst-nat chain=dstnat comment=MailServ dst-port=3322 in-interface=\
    wan protocol=tcp to-addresses=10.34.7.248 to-ports=22
add action=masquerade chain=srcnat comment=MailServ disabled=yes dst-address=\
    10.34.7.247 log=yes src-address=10.34.0.0/16
add action=masquerade chain=srcnat dst-address=192.168.33.0/24 src-address=\
    10.34.7.0/24
/ip firewall raw
add action=drop chain=prerouting comment=BlackList src-address-list=blacklist
/ip route
add distance=1 dst-address=192.168.3.0/24 gateway=10.34.7.150
add distance=1 dst-address=192.168.33.0/24 gateway=172.0.0.33
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/ip ssh
set forwarding-enabled=remote
/ppp secret
add local-address=192.168.45.1 name=SMK1 password=Kolbasa1 remote-address=\
    192.168.45.3
add name=Serik1 password=KvadoSklad19 profile=vpn-local
add name=Serik2 password=KvadoCeh19 profile=vpn-local
add name=LoskMagaz password=LoskInstrument21 profile=vpn_rout remote-address=\
    172.0.0.33
add name=ArtemPVS password=ServeRArteM#4% profile=vpn_rout service=l2tp
/system clock
set time-zone-name=Europe/Kiev
