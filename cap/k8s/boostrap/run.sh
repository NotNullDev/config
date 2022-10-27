#!/bin/bash
sudo kubeadm init   --pod-network-cidr 10.244.0.0/16   --cri-socket unix:///var/run/crio/crio.sock
sudo cp /etc/kubernetes/admin.conf /home/$USER/.kube/config
sudo cp /etc/kubernetes/admin.conf /root/.kube/config