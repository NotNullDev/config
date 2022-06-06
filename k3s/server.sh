#!/bin/bash
curl -sfL https://get.k3s.io | K3S_NODE_NAME="control-pane" sh -
sudo chown $USER /etc/rancher/k3s/k3s.yaml
cat ~/.bashrc > /dev/null && sudo kubectl completion bash >> ~/.bashrc 
cat ~/.zshrc  > /dev/null && sudo kubectl completion zsh  >> ~/.zshrc 
sudo ufw allow 6443
sudo ufw allow 22
echo y | sudo ufw enable