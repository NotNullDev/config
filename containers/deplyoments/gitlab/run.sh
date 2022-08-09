#!/bin/bash

# https://docs.gitlab.com/charts/installation/deployment.html
# https://docs.gitlab.com/charts/quickstart/index.html

# address_public_ip="192.168.0.21"
# gitlab_hists_domain="gitlab.example.com"


# if [ $address_public_ip = "" ]
# then
# echo "Please edit address_public_ip in script before running this script."
# fi

# echo "$address_public_ip           $gitlab_hists_domain" | sudo tee -a /etc/hosts

# helm repo add gitlab https://charts.gitlab.io/ \

helm install -f values.yaml gitlab gitlab/gitlab