#!/bin/bash

nfs_folder="/share"

sudo apt -y install nfs-kernel-server
sudo systemctl enable --now nfs-server
sudo mkdir $nfs_folder

echo "$nfs_folder    *(rw,no_root_squash)" | sudo tee -a /etc/exports
sudo exportfs -rav
sudo systemctl restart nfs-server