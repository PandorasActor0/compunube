#!/bin/bash
echo "configurando el resolv.conf con cat"
cat <<TEST> /etc/resolv.conf
nameserver 8.8.8.8
TEST
echo "instalando un servidor vsftpd"
sudo apt-get install vsftpd -y
echo “Modificando vsftpd.conf con sed”
sed -i 's/#write_enable=YES/write_enable=YES/g' /etc/vsftpd.conf
echo "configurando ip forwarding con echo"
sudo echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

echo "instalando Jupiter notebooks"
sudo apt -y install python3-pip
pip3 install jupyter
export PATH="$HOME/.local/bin:$PATH" 

sudo apt-get install lxd-installer -y

newgrp lxd
lxd init --auto
lxc launch ubuntu:18.04 web1

lxc exec web1 /bin/bash

apt update && apt upgrade -y
apt install apache2 -y
systemctl enable apache2