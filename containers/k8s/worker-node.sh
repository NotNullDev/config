#!/bin/bash

sudo bash ../sudo_nopasswd.sh

sudo apt update
sudo apt install ansible -y

ansible-playbook ../zsh_install.yml
ansible-playbook ../docker_install.yml
ansible-playbook ../utils_install.yml

sudo bash ./containerd.sh
sudo bash ./kubetools.sh

echo "kubeadm is ready to join cluster"
echo "Run command below on control-pane node to generate join command"
echo "kubeadm token create --print-join-command"