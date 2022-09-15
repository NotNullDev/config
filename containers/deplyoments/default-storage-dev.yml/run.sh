#!/bin/bash

#kubectl apply -f https://k8s.io/examples/pods/storage/pv-volume.yaml
#kubectl apply -f https://k8s.io/examples/pods/storage/pv-claim.yaml

sudo mkdir -p /etc/data

kubectl apply -f pv-volume.yaml
kubectl apply -f storage-class.yaml

kubectl patch storageclass my-default-local-storage -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

# kubectl apply -f ./pv-volume.yaml
# kubectl get pv task-pv-volume

# # kubectl apply -f ./pv-claim.yaml
# # kubectl get pv task-pv-volume
# # kubectl get pvc task-pv-claim