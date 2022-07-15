#!/bin/bash

nfs_folder=""

if [ $nfs_folder = "" ]; then
read -r -p "nfs_folder was not set. Use default /share ? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        nfs_folder="/share"
        break;
        ;;
    *)
        exit
        ;;
esac
fi


sudo apt update && sudo apt -y install nfs-kernel-server
sudo systemctl enable --now nfs-server
sudo mkdir $nfs_folder

echo "$nfs_folder    *(rw,no_root_squash)" | sudo tee -a /etc/exports
sudo exportfs -rav
sudo systemctl restart nfs-server