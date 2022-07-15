#!/bin/bash
cat /etc/ssh/sshd_config | grep "PasswordAuthentication yes" \
 > /dev/null || \
cat<<EOF | sudo tee -a /etc/ssh/sshd_config > /dev/null
PasswordAuthentication yes
ChallengeResponseAuthentication yes
Port 2222
ListenAddress 0.0.0.0
EOF
sudo ufw allow 2222 > /dev/null
sudo service ssh start > /dev/null
# replace .zshrc with your shell rc file
cat ~/.zshrc | grep "sudo service ssh status > /dev/null || sudo service ssh start" \
|| \
cat<<EOF >> ~/.zshrc
sudo service ssh status > /dev/null || sudo service ssh start
EOF
wsl=$(ip a | grep eth0 | grep inet | cut -d "/" -f 1 | xargs | cut -d " " -f 2)
echo "to connect from windows copy:"
echo "ssh $USER@$wsl -p 2222"
# then from windows:
# ssh <user>@<wsl-ip> -p 2222