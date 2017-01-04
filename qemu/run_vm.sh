#!/bin/bash
port=2223
echo "ssh local port : $port  (bash args are append)"
cmd="qemu-system-x86_64 -enable-kvm -drive file=fedora19_stapisdk.qcow2,format=qcow2 -m 2G -nographic -redir tcp:$port::22 $*"
echo $cmd
$cmd
