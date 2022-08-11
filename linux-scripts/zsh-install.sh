#!/bin/bash

sudo apt install curl zsh -y
sudo chsh $USER -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "soruce ~/.zshrc"