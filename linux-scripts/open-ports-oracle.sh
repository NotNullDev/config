#!/bin/bash

sudo firewall-cmd --add-port=6443/tcp
sudo firewall-cmd --add-port=3000-32767/tcp
sudo firewall-cmd --runtime-to-pernament