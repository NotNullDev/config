## Exposing load balancer via kubectl
```shell
kubectl expose deployment <deployment_name> --port=8765 --target-port=9376 \
        --name=example-service --type=LoadBalancer
```
