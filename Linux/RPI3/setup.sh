#!/bin/sh

sudo cp ../common/config_files/sources.list /etc/apt/
sudo cp ../common/config_files/csh.cshrc /etc/
sudo cp ../common/config_files/vimrc /etc/vim/
sudo cp config_files/config.txt /boot/
sudo cp config_files/network/dhcpcd.conf /etc/
sudo cp config_files/network/resolv.conf /etc/
sudo cp config_files/ssh/authorized_keys ~/.ssh/

sudo apt update
sudo apt upgrade --yes
sudo apt install --upgrade --yes tcsh
sudo apt install --upgrade --yes vim

sudo awk 'BEGIN { FS=":"; OFS=":"; } {if (($1=="root" || $1=="pi") && $7!="/bin/tcsh") { $7="/bin/tcsh"; print; } else print; }' /etc/passwd > /etc/passwd.tmp && mv /etc/passwd.tmp /etc/passwd
sudo awk '{if (/PasswordAuthentication/) gsub($2, "no");print}' /etc/ssh/sshd_config > /etc/ssh/sshd_config.tmp && mv /etc/ssh/sshd_config.tmp /etc/ssh/sshd_config

# install nas
cd nas
./install_nas.sh
cd ..

