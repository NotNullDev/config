#!/bin/bash
server_ip=""
server_nfs_path=""
mount_folder=""

if [ $server_ip = "" ] || [ $server_nfs_path = "" ] || [ $mount_folder = "" ]
then
echo "Please edit script and fill out required variables."
exit
fi

sudo apt update && sudo apt install nfs-common -y
sudo mkdir -p  $mount_folder
sudo mount $server_ip:$server_nfs_path $mount_folder