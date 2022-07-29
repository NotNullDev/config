#!/bin/bash
yes qwqw | sudo passwd ubuntu;
yes qwqw | sudo passwd root;
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
git clone https://github.com/notnulldev/config