#!/bin/bash
sudo kubeadm reset --force
sudo rm -rf /etc/cni/net.d
sudo iptables -F
sudo rm -rf /etc/kubernetes
sudo rm -rf /root/.kube
sudo rm -rf /home/$USER/.kube



cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# sysctl params required by setup, params persist across reboots
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

# Apply sysctl params without reboot
sudo sysctl --system

wget https://github.com/flannel-io/flannel/releases/download/v0.20.0/flanneld-amd64
sudo chmod +x flanneld-amd64
sudo mv flanneld-amd64 flanneld
sudo mv flanneld /usr/bin

kubeadm join 10.174.12.142:6443 --token 3x3ffa.6jb1vsyw8efy108o \
        --discovery-token-ca-cert-hash sha256:a210be4345b5ca958099be0c1d2e2ca5c203defb828c6c047e2790a9b802f0b2 \
        --pod-network-cidr 10.244.0.0/24