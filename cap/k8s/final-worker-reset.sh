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

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

cat<<eof | sudo tee /etc/crio/crio.conf.d/02-cgroup-manager.conf
[crio.runtime]
conmon_cgroup = "pod"
# cgroup_manager = "cgroupfs" ! DONT
eof
sudo systemctl restart crio

# Apply sysctl params without reboot
sudo sysctl --system

# quick workaround
# cat<<eof | sudo tee /run/flannel/subnet.env
# FLANNEL_NETWORK=10.244.0.0/16
# FLANNEL_SUBNET=10.244.0.1/24
# FLANNEL_MTU=1450
# FLANNEL_IPMASQ=true
# eof

wget https://github.com/flannel-io/flannel/releases/download/v0.20.0/flanneld-amd64
sudo chmod +x flanneld-amd64
sudo mv flanneld-amd64 flanneld
sudo mv flanneld /usr/bin

# generate using command below from kubectl
# kubeadm token create --print-join-command
kubeadm join 10.174.12.142:6443 --token 51hnvu.9og5o6homnkdq5hh --discovery-token-ca-cert-hash sha256:4a1afac88fe6611e2a9fc547929f7f7a744dffaae17ecd9366d0b400b3cf37e0 

# doesn't work
# kubectl patch node all -p '{"spec":{"podCIDR":"10.244.0.0/16"}}'