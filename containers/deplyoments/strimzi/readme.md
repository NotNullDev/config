https://strimzi.io/quickstarts/
```shell

kubectl apply -f ./init.yaml
kubectl apply -f ./simple-kafka.yaml

# wait until the pods are ready
kubectl get pods -w
kubectl apply -f ./kafka-ui.yaml
```