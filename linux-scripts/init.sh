#!/bin/bash
sudo apt update && \
sudo apt install ansible && \
ansible-playbook ./zsh_install.yml && \
bash ./docker.sh && \
bash k3s ./server.sh && \
sudo apt install nginx-proxy-manager && \
echo "source ~/.zshrc"
