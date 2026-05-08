#
# nmcli script to configure 3 bridges, connected to 3 vxlans, using multicast on a local network
# extends a bridge over a network domain, useful for openstack
#
#  X1,X2,X3 - name of bridge
#  Y1,Y2,Y3 - network of bridge
#  y1,y2,y3 - VNI/id
#  DEV      - nmcli device
#  H        - host (/netmask)
#  X        - multicast address (224.0.0.0 - 239.255.255.255)
#
#  dstprt   - destination port (default-8472)
#
#
nmcli con add type bridge con-name br-X1     ifname br-X1     ipv4.method manual ipv4.address Y1.H/24 ipv6.method disabled ethernet.mtu 1400 \
nmcli con add type vxlan  con-name vxlan-X1  ifname vxlan-X1 remote 224.0.0.X id Z1 dev DEV ipv4.method disabled ipv6.method disabled connection.master br-X1  connection.slave-type bridge local 192.168.y1.H ethernet.mtu 1450 \
&& \
nmcli con add type bridge con-name br-X2     ifname br-X2     ipv4.method manual ipv4.address Y2.H/24 ipv6.method disabled ethernet.mtu 1400 \
nmcli con add type vxlan  con-name vxlan-X2 ifname vxlan-X2  remote 224.0.0.X id Z2 dev DEV ipv4.method disabled ipv6.method disabled connection.master br-X2  connection.slave-type bridge local 192.168.y2.H ethernet.mtu 1450 \
&& \
nmcli con add type bridge con-name br-X3     ifname br-X3     ipv4.method manual ipv4.address Y3.H/24 ipv6.method disabled ethernet.mtu 1400 \
nmcli con add type vxlan  con-name vxlan-X3  ifname vxlan-X3  remote 224.0.0.X id Z3 dev DEV ipv4.method disabled ipv6.method disabled connection.master br-X3  connection.slave-type bridge local 192.168.y3.H ethernet.mtu 1450
