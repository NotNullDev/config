#!/bin/bash

#kubectl apply -f https://k8s.io/examples/pods/storage/pv-volume.yaml
#kubectl apply -f https://k8s.io/examples/pods/storage/pv-claim.yaml

sudo mkdir /etc/data

kubectl apply -f ./pv-volume.yaml
kubectl get pv task-pv-volume

kubectl apply -f ./pv-claim.yaml
kubectl get pv task-pv-volume
kubectl get pvc task-pv-claim

