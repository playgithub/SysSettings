#!/bin/sh

sudo mount -t cifs //192.168.1.99/share_1 ./1 -o username='pi',password='smb2345@#$%',rw,dir_mode=0777,file_mode=0777 
sudo mount -t cifs //192.168.1.99/share_2 ./2 -o username='pi',password='smb2345@#$%',rw,dir_mode=0777,file_mode=0777 
sudo mount -t cifs //192.168.1.99/share_3 ./3 -o username='pi',password='smb2345@#$%',rw,dir_mode=0777,file_mode=0777 
sudo mount -t cifs //192.168.1.99/share_4 ./4 -o username='pi',password='smb2345@#$%',rw,dir_mode=0777,file_mode=0777 
