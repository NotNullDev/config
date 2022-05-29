#!/bin/bash
server_ip="192.168.0"
server_nfs_path="/share"
mount_folder="/mounted-nfs"

sudo apt update && sudo apt install nfs-common
sudo mkdir -p  $mount_folder
sudo mount $server_ip:$server_nfs_path $mount_folder