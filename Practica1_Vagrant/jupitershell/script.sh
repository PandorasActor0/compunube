#!/bin/bash
sudo apt-get update
echo "instalando Jupiter notebooks"
sudo apt -y install python3-pip
pip3 install jupyter
export PATH="$HOME/.local/bin:$PATH" 