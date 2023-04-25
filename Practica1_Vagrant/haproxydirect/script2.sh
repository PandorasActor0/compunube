#!/bin/bash

apt update && apt upgrade -y
apt install haproxy -y
apt install vim -y
systemctl enable haproxy