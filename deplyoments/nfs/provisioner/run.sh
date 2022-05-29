#!/bin/bash
#https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner

# Edit env if you are using other namespace than default
NS=$(kubectl config get-contexts|grep -e "^\*" |awk '{print $5}')
NAMESPACE=${NS:-default}
sed -i'' "s/namespace:.*/namespace: $NAMESPACE/g" ./rbac.yaml ./deployment.yaml

kubectl apply -f ./rbac.yaml


# Edit deployment.yml with our host and share folder
kubectl apply -f ./deployment.yaml

kubectl apply -f class.yaml