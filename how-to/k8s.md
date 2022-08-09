Create simplest deployment
`kubectl get all -o wide`
`kubectl create deployment nginx --image nginx --port 80`
`kubectl get all`


`kubectl expose deployment nginx --port 80`
    Now you can run
`kubectl get all`
    To check nginx service internal ip and curl <internal_ip>

    In order to expose nginx as loadbalancer:
`kubectl expose deployment nginx --port 80 --type=LoadBalancer`

`kubectl get all`

    Now you should have new entry in services with type LoadBalancer and an exposed IP address.
    You can take it ip address and curl it. It will respond with standard NGINX welcome page.
    If there is external ip shown as <pending>, then LoadBalancer is not working or is not installed. Check MetalLB folder.