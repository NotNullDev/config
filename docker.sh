#!/bin/bash
# docker
curl get.docker.com | sudo bash
sudo usermod -aG docker $USER && newgrp docker