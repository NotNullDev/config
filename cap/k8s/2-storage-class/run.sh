#!/bin/bash
# install csi smb driver
# https://github.com/kubernetes-csi/csi-driver-smb/blob/master/docs/install-csi-driver-v1.9.0.md
curl -skSL https://raw.githubusercontent.com/kubernetes-csi/csi-driver-smb/v1.9.0/deploy/install-driver.sh | bash -s v1.9.0 --
kubectl -n kube-system create secret generic smbcreds --from-literal username="Administrator" --from-literal password="QAZwsx123"
kubectl apply -f ./storageclass.yml
kubectl patch storageclass smb -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
kubectl -n kube-system get pod -o wide --watch -l app=csi-smb-controller
kubectl -n kube-system get pod -o wide --watch -l app=csi-smb-node
kubectl get sc