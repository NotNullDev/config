#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "This script need to be with sudo."
  exit
fi

sudo apt update && sudo apt install ansible
sudo bash ./sudo_nopasswd.sh >> /dev/null

ansible-playbook ./zsh_install.yml
ansible-playbook ./docker_install.yml
ansible-playbook ./utils_install.yml