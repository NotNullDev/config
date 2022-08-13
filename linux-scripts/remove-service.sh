#!/bin/bash

service_name=imwheel

sudo systemctl stop $service_name*
sudo systemctl disable $service_name*
sudo rm /etc/systemd/system/$service_name*
sudo rm /etc/systemd/system/$service_name* # and symlinks that might be related
sudo rm /usr/lib/systemd/system/$service_name*
sudo rm /usr/lib/systemd/system/$service_name* # and symlinks that might be related
sudo systemctl daemon-reload
sudo systemctl reset-failed

sudo systemctl status $service_name