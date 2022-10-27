#!/bin/bash
wget https://github.com/flannel-io/flannel/releases/download/v0.20.0/flanneld-amd64
sudo chmod +x flanneld-amd64
sudo mv flanneld-amd64 flanneld
sudo mv flanneld /usr/bin
kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml
# kubectl apply -f ./kube-flannel.yml