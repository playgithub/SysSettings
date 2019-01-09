#!/bin/sh

# config system
sudo cp ../common/config_files/sources.list /etc/apt/
sudo cp ../common/config_files/csh.cshrc /etc/
sudo cp ../common/config_files/vimrc /etc/vim/
sudo cp config_files/network/resolv.conf /etc/
sudo cp config_files/network/interfaces /etc/network/
sudo cp -r config_files/ssh/ ~/


sudo awk 'BEGIN { FS=":"; OFS=":"; } {if (($1=="root" || $1=="disc") && $7!="/bin/tcsh") { $7="/bin/tcsh"; print; } else print; }' /etc/passwd > /etc/passwd.tmp && mv /etc/passwd.tmp /etc/passwd


# mount samba at RPI3
sudo cp -r smb ~/

# prepare softwares
sudo apt update
sudo apt upgrade --yes
sudo apt install --upgrade --yes tcsh
sudo apt install --upgrade --yes python3
sudo apt install --upgrade --yes python3-pip
sudo apt install --upgrade --yes build-essential
sudo apt install --upgrade --yes git
sudo apt install --upgrade --yes vim

