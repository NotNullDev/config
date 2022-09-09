```shell

# helm repo add grafana https://grafana.github.io/helm-charts
# helm search repo
# helm show values grafana/loki > values.yaml # configure
# # helm upgrade --install --namespace loki loki grafana/loki -f values.yaml
# helm upgrade --install --namespace loki loki grafana/loki

# add to grafana http://loki.loki:3100

helm repo add grafana https://grafana.github.io/helm-charts
kubectl create ns loki
helm upgrade --install loki --namespace=loki grafana/loki-simple-scalable
kubectl edit cm loki # auth_enabled: false

[repo](https://github.com/minio/minio/tree/master/helm/minio)
# add minio (ha storage with compatibility with s3)
helm repo add minio https://charts.min.io/
kubectl create ns minio
helm install --namespace minio --set rootUser=root,rootPassword=password123 --generate-name minio/minio

```
