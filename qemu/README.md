# Bridge host config
 * `modprobe kvm-intel` or, add to modules.conf kvm-intel
 * setup br0 iface, disable existing iface (WIFI don't support bridge)
```
auto br0
iface br0 inet static
	address 192.168.10.51
	netmask 255.255.255.0
	gateway 192.168.10.1
	bridge_ports enp1s0
	bridge_stp off
	bridge_maxwait 5
```
 * add br0 to allowed iface in qemu `echo "allow br0" >> /etc/qemu/bridge.conf`

