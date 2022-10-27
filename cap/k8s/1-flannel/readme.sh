# troubleshooting flannel
https://stackoverflow.com/questions/61373366/networkplugin-cni-failed-to-set-up-pod-xxxxx-network-failed-to-set-bridge-add

# run on every node:
ip link set cni0 down && ip link set flannel.1 down 
ip link delete cni0 && ip link delete flannel.1
# systemctl restart containerd && systemctl restart kubelet
systemctl restart crio && systemctl restart kubelet

# flannel crio problem
# https://github.com/rodericliu/kube-flannel-crio-yaml

# https://github.com/cri-o/cri-o/blob/main/tutorials/kubernetes.md
{
    "name": "crio",
    "type": "flannel"
}

{
  "name": "cbr0",
  "cniVersion": "0.3.1",
  "plugins": [
    {
      "type": "flannel",
      "delegate": {
        "hairpinMode": true,
        "isDefaultGateway": true
      }
    },
    {
      "type": "portmap",
      "capabilities": {
        "portMappings": true
      }
    }
  ]
}

# changge cbr0 to command above