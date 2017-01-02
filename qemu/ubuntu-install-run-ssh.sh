#!/bin/bash

#install qemu
sudo apt install qemu qemu-utils

#get ubuntu server from the net

#create an image file
qemu-img create ubuntu.img 20G

#install system. -enable-kvm is jut for enabling better perfs
qemu-system-x86_64 -enable-kvm -hda ubuntu.img -boot d -cdrom /path/to/ubuntu-16.04.1-server-amd64.iso -m 2G

#run system without graphic, with ssh port (only) redirected to localhost
qemu-system-x86_64 -enable-kvm -hda ubuntu.img -m 2G -nographic -redir tcp:2222::22

#from host system, can now login with
ssh -p 2222 user@localhost
