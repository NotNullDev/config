#!/bin/bash
yes qwqw | sudo passwd ubuntu;
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
git clone https://github.com/notnulldev/config