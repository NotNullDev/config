#!/bin/bash

sudo apt update
sudo apt install imwheel

sudo cp /bin/imwheel /usr/local/bin/imwheel
sudo chmod +x /usr/local/bin/imwheel

SERVICE_NAME=imwheel

cat<<eof | sudo tee ~/.imwheelrc
".*-chrome*"
None,      Up,   Button4, 3
None,      Down, Button5, 3
Control_L, Up,   Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L,   Up,   Shift_L|Button4
Shift_L,   Down, Shift_L|Button5
eof

cat<<eof | sudo tee /lib/systemd/system/$SERVICE_NAME.service
[Unit]
Description=$SERVICE_NAME
After=display-manager.service

[Service]
Type=simple
Restart=no
StartLimitBurst=2
ExecStart=/usr/local/bin/imwheel -b "4 5"
StartupWMClass=jetbrains-webstorm
# Environment="XAUTHORITY=/home/pi/.Xauthority"

[Install]
WantedBy=graphical.target
eof

# WantedBy=multi-user.tagetr


sudo systemctl daemon-reload

sudo systemctl status $SERVICE_NAME

echo "sudo systemctl status $SERVICE_NAME-service"
echo ""
echo ""
echo "sudo rm /lib/systemd/system/$SERVICE_NAME.service"
echo "sudo systemctl status $SERVICE_NAME"
echo "sudo systemctl daemon-reload"
