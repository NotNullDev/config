#!/bin/bash

ip_range=10.0.0.0/16

sudo kubeadm init --pod-network-cidr=$ip_range

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

wget https://projectcalico.docs.tigera.io/manifests/tigera-operator.yaml

sed -i ///

cat tigera-operator.yaml

while true; do
    read -p "Do you want to proceed with these  resource definitions?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

kubectl create -f tigera-operator.yaml
