# https://docs.gitlab.com/operator/installation.html#ingress-controller
# install metrics
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
# https
https://docs.gitlab.com/omnibus/settings/nginx.html