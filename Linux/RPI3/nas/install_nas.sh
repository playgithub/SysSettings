#!/bin/tcsh

sudo apt install --upgrade --yes ntfs-3g samba samba-common-bin autofs
sudo cp ./config_files/samba/smb.conf /etc/samba/
sudo cp ./config_files/autofs/* /etc/

