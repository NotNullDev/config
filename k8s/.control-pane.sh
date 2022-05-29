#!/bin/bash

# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/

echo "Install script started at $(date)"
printf "\n"
if [ "$EUID" -eq 0 ]
  then 
  echo "Please do not run this script as root or sudo (instead run as passwordless sudo user)"
  echo "In order to activate passwordless sudo execute from root folder of this this script:"
  echo ""
  echo "bash ../sudo_nopasswd.sh"
  exit
fi
echo "Strating initial checks"
# checks
systemctl status containerd > /dev/null

if [ $? -ne 4 ]
then
  echo "error: containerd is already installed on system"
  exit
fi

kubectl > /dev/null
if [ $? -eq 0 ]
then
  echo "kubectl already exists, exiting" 
  exit
fi

kubeadm > /dev/null
if [ $? -eq 0 ]
then
  echo "kubectl already exists, exiting"
  exit
fi

kubelet > /dev/null
if [ $? -eq 0 ]
then
  echo "kubelet already exists, exiting"
  exit
fi

# install_containerd()
echo "Installing containerd:"

if [ -d "./bin/kubetools" ]
then
sudo dpkg -i ./bin/kubetools/containerd*
else
echo "Local files not found. Performing online installation."
sudo apt update && sudo apt install containerd -y
fi

if [ $? -ne 0  ]
then
  echo "error,exiting"
  exit
fi

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

#sudo dnf install -y grubby && \
#  sudo grubby \
#  --update-kernel=ALL \
#  --args="systemd.unified_cgroup_hierarchy=1"

cat << EOF | sudo tee -a /etc/containerd/config.toml
[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
  [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
    SystemdCgroup = true
EOF

sudo sed -i 's/^disabled_plugins.*cri.*/#disabled_plugins = ["cri"]/' /etc/containerd/config.toml

sudo systemctl restart containerd
sudo swapoff -a
sudo sed -i '/^[^#]/ s/\(^.*swap.*$\)/#\ \1/' /etc/fstab

sed -i'' "s/namespace:.*/namespace: $NAMESPACE/g" ./rbac.yaml ./deployment.yaml
# end install_containerd()

# install_kubetools()
echo "Installing kubeadm kubectl kubelet"


sudo dpkg -i ./bin/other/*

if [ $? -ne 0 ]
then
  echo "error, exiting"
  exit $?
fi

# add google 
sudo cp ./bin/apt-key.gpg /usr/share/keyrings/kubernetes-archive-keyring.gpg 
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

if [ -d "./bin/kubetools" ]
then
sudo dpkg -i ./bin/kubetools/kube*
else
echo "Local files not found. Performing online installation."
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt install kubectl kubeadm kubelet -y
sudo apt-mark hold kubelet kubeadm kubectl 
fi

# completions
zsh --version &> /dev/null
if [ "$?" -eq 0  ]
then
echo "Installing zsh autocompletions"
kubectl completion zsh >> ~/.zshrc
kubeadm completion zsh >> ~/.zshrc
source ~/.zshrc
fi

bash --version &> /dev/null
if [ "$?" -eq 0  ]
then
echo "Installing bash autocompletions"
kubectl completion bash >> ~/.bashrc  
kubeadm completion bash >> ~/.bashrc
source ~/.bashrc           
fi

# end install_kubetools()

# installing local images if provided (for offline installation)

if [ "$(ls ./bin/images/*.tar)" != "" ]
then
  sudo ctr -n k8s.io i import ./bin/images/*.tar
else
  echo "Not found any containers to install"
fi

# --service-cidr string     Default: "10.96.0.0/12"
sudo kubeadm init \
--pod-network-cidr 10.244.0.0/16 # required for flannel (even with default value)
# --apiserver-bind-port 8080 --apiserver-advertise-address 0.0.0.0

if [ $? -ne 0 ]
then
  echo "Error installing kubeadm."
  echo "You can try to revert changes by running ./reset-kubeadm.sh"
  exit
fi

mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

# network plugin (Flannel)
if ! [ -f ./bin/flanneld ]
then
wget https://github.com/flannel-io/flannel/releases/download/v0.18.0/flanneld-amd64
mv flanneld-amd64 ./bin/flanneld
fi

sudo mkdir -p /opt/bin
sudo cp ./bin/flanneld /opt/bin/flanneld
sudo chmod +x /opt/bin/flanneld
# kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f ./kube-flannel.yaml

# allow scheduling pods on control pane (single node cluster)
#  disabling control pane isolation
kubectl taint nodes --all node-role.kubernetes.io/control-plane- node-role.kubernetes.io/master- node.kubernetes.io/not-ready- 
# verify installation
kubectl get pods --all-namespaces
echo "-----------------------------------------------"
echo ""
echo "To verify installation run (waking up may take up to 5mins):"
echo "kubectl get pods --all-namespaces"
echo ""
echo ""
echo "Run command below to get fresh join command"
echo "kubeadm token create --print-join-command"
echo ""
echo "-----------------------------------------------"
echo ""
echo "Scripts ended at $(date)"