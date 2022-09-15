[repo](https://github.com/prometheus-operator/prometheus-operator)

# TLDR

```shell
# minikube only (warning: this will delete all existing data)
#minikube delete && minikube start --kubernetes-version=v1.23.0 --memory=6g --bootstrapper=kubeadm --extra-config=kubelet.authentication-token-webhook=true --extra-config=kubelet.authorization-mode=Webhook --extra-config=scheduler.bind-address=0.0.0.0 --extra-config=controller-manager.bind-address=0.0.0.0

# minikube addons disable metrics-server


git clone https://github.com/prometheus-operator/kube-prometheus

https://github.com/prometheus-operator/kube-prometheus
cd kube-prometheus

kubectl apply --server-side -f manifests/setup
kubectl wait \
	--for condition=Established \
	--all CustomResourceDefinition \
	--namespace=monitoring
kubectl apply -f manifests/

# grafana pwd: admin:admin

# prometheus-grafana secret

# kubectl delete --ignore-not-found=true -f manifests/ -f manifests/setup
# enjoy!
```