#!/bin/bash
port=2223
echo "See README for host configuration of bridge"
echo "ssh local port : $port  (bash args are append, -smp n for n proc)"
cmd="qemu-system-x86_64 -enable-kvm \
	-drive file=drive.qcow2,format=qcow2 \
	-m 2G  -smp 4 -daemonize -display none \
	-net nic -net bridge,br=br0 $*"
echo $cmd
$cmd
