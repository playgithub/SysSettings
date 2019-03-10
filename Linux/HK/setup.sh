#!/bin/sh

# config system
cp ../common/config_files/csh.cshrc /etc/
cp ../common/config_files/vimrc /etc/vim/
#cp ../common/config_files/sources.list /etc/apt/
cp config_files/resolv.conf /etc/
cp config_files/ssh/authorized_keys ~/.ssh/
cp config_files/ssh/ssh_config /etc/ssh/

# prepare system
apt update
apt upgrade --yes
apt install --upgrade --yes tcsh
apt install --upgrade --yes python3
apt install --upgrade --yes python3-pip
apt install --upgrade --yes build-essential
apt install --upgrade --yes git
apt install --upgrade --yes vim
apt install --upgrade --yes shadowsocks
update-rc.d shadowsocks remove

awk '{if (/PasswordAuthentication/) gsub($2, "no");print}' /etc/ssh/sshd_config > /etc/ssh/sshd_config.tmp && mv /etc/ssh/sshd_config.tmp /etc/ssh/sshd_config
awk 'BEGIN { FS=":"; OFS=":"; } {if ($1=="root" && $7!="/bin/tcsh") { $7="/bin/tcsh"; print; } else print; }' /etc/passwd > /etc/passwd.tmp && mv /etc/passwd.tmp /etc/passwd

# prepare shadowsocks
cd sss
make && make install && make clean
cd ..

cp sss/sss_service_script/sss /etc/init.d/
chmod 755 /etc/init.d/sss
update-rc.d sss defaults

# start shadowsocks server
sss start

