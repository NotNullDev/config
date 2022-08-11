#!/bin/bash
sudo apt update
sudo apt install imwheel

cat<<eof | sudo tee ~/.imwheelrc
".*-chrome*"
None,      Up,   Button4, 3
None,      Down, Button5, 3
Control_L, Up,   Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L,   Up,   Shift_L|Button4
Shift_L,   Down, Shift_L|Button5
eof

echo @reboot /usr/bin/imwheel -b "4 5" | crontab -