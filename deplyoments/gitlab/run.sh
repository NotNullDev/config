#!/bin/bash

# https://docs.gitlab.com/charts/installation/deployment.html
# https://docs.gitlab.com/charts/quickstart/index.html

address_public_ip=""
gitlab_hists_domain="gitlab.dummyhost.com"


if [ $address_public_ip = "" ]
then
echo "Please edit address_public_ip in script before running this script."
fi

echo "$address_public_ip           $gitlab_hists_domain" | sudo tee -a /etc/hosts

helm repo add gitlab https://charts.gitlab.io/ \
&& \
helm install gitlab gitlab/gitlab \
    --set global.hosts.domain=$gitlab_hists_domain \
    --set certmanager-issuer.email=me@e$gitlab_hists_domain