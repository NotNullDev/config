>You need to have load balancer configured in the cluster if you are using k8s on bare metal

[Documentation](https://kubernetes.github.io/ingress-nginx/deploy/)

# TROUBLESHOOTING

**IF SOMETHING IS NOT WORKING TRY TO DISABLE YOUR FIREWALL FIRST**

`kubectl create ingress nginx --rule="nginx.example.com/=nginx:80" --class='nginx'`
`kubectl get ing`

    Find external ip of nginx-ingress service
`kubectl get all -n nginx-ingress`

    And edit your host file so provided host match with nginx-ingress external ip

    For example, if you created ingress that points to app.example.com
    You have to add to your hosts file:
    <nginx-ingress-ip> nginx.example.com

    So your host will looks similar to:
    192.168.0.240 nginx.example.com

    host file location:
        linux:
            /etc/hosts
        windows:
            c:/windows/system32/drivers/etc/hosts


## Troubleshooting

If nginx gives 404 then you may not have specified ingressClassName in ingress file