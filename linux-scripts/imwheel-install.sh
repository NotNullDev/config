#!/bin/bash

sudo apt update
sudo apt install imwheel

cat<<eof ~/.config/autostart/imwhell.sh
imwheel -b "4 5"
eof

sudo killall imwheel;nohup imwheel -b "4 5"