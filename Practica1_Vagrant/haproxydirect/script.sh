#!/bin/bash
echo "configurando el resolv.conf con cat"
cat <<TEST> /etc/resolv.conf
nameserver 8.8.8.8
TEST

apt update && apt upgrade -y
apt install apache2 -y
apt install vim -y
systemctl enable apache2