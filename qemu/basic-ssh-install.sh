#!/bin/bash

#install qemu (on Ubuntu)
sudo apt install qemu qemu-utils

#get install media (ubuntu, fedora, etc)

#create an image file (raw)
qemu-img create disk.img 20G
#(qcow2)
qemu-img create -f qcow2 disk.img 20G

#install system. -enable-kvm is jut for enabling better perfs
qemu-system-x86_64 -enable-kvm -drive file=disk.img,format=qcow2 -m 2G -boot d -cdrom /path/to/ubuntu-16.04.1-server-amd64.iso

#run system without display, with ssh port (only) redirected to localhost
qemu-system-x86_64 -enable-kvm -drive file=disk.img,format=qcow2 -m 2G -daemonize -display none -redir tcp:2222::22
#default use 1 processor, change by adding "-smp n"

#from host system, can now login with
ssh -p 2222 user@localhost

#from guest, access client using
ssh user@10.0.2.2
sshfs user@10.0.2.2:/whatever/path ~/local/path
