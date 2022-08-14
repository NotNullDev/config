#!/bin/bash

sudo dpkg --add-architecture i386

sudo wget -nc -P /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources

sudo apt update

sudo apt install --install-recommends winehq-stable \
|| sudo apt install --install-recommends winehq-devel -y  \
|| sudo apt install --install-recommends winehq-staging- y
