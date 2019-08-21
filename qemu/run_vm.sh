#!/bin/bash
port=2223
echo "ssh local port : $port  (bash args are append, -smp n for n proc)"
cmd="qemu-system-x86_64 -enable-kvm -drive file=fedora19_stapisdk.qcow2,format=qcow2 -m 2G -daemonize -display none -device e1000,netdev=user.0 -netdev user,id=user.0,hostfwd=tcp::$port-:22 -smp 4"
echo $cmd
$cmd
