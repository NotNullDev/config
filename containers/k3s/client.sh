#!/bin/bash

if [ $# -eq 2 ]
then
curl -sfL https://get.k3s.io | K3S_URL="$1" K3S_TOKEN="$2" K3S_NODE_NAME="$3" sh -
else
echo "Please provide"
echo "K3S_URL as first argument" 
echo "K3S_TOKEN as second argument"
echo "K3S_NODE_NAME as third argument"
fi