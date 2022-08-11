#!/bin/bash

sudo apt update
sudo apt install imwheel
gedit ~/.imwheelrc

SERVICE_NAME=startimwheel

cat<<eof | sudo tee /bin/$SERVICE_NAME.sh
".*-chrome*"
None,      Up,   Button4, 3
None,      Down, Button5, 3
Control_L, Up,   Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L,   Up,   Shift_L|Button4
Shift_L,   Down, Shift_L|Button5
eof

cat<<eof | sudo tee /lib/systemd/system/startimwheel.service
[Unit]
Description=startimwheel
After=network.target network-online.target

[Service]
Type=simple
User=$USER
Group=<required_group_name>
Restart=always
ExecStartPre=/bin/mkdir -p /var/run/$SERVICE_NAME
PIDFile=/var/run/$SERVICE_NAME/service.pid
ExecStart=/bin/bash /bin/$SERVICE_NAME.sh

[Install]
WantedBy=multi-user.target
eof

sudo systemctl daemon-reload
