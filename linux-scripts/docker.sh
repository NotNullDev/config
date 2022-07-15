#!/bin/bash

sudo apt update
curl https://get.docker.com | sudo bash

sudo usermod -aG docker $USER && newgrp docker