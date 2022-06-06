#!/bin/bash
curl -sfL https://get.k3s.io | K3S_NODE_NAME="control-pane" sh -
sudo chown $USER /etc/rancher/k3s/k3s.yaml