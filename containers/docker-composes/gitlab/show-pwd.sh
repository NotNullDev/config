#!/bin/bash
echo "username: root"
echo "password: $(sudo docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password)"