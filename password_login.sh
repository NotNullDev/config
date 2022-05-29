#!/bin/bash
yes ubuntu | sudo passwd ubuntu && echo "PasswordAuthentication yes" | sudo tee -a /etc/ssh/sshd_config