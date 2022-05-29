#!/bin/bash
wget https://github.com/rancher/rke/releases/download/v1.3.11/rke_linux-amd64
mv rke_linux-amd64 rke
chmox +x ./rke
sudo mv ./rke /bin
rke --version || echo "error: rke is not installed."; exit;
