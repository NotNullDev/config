#!/bin/bash

sudo apt install curl zsh git wget -y
sudo chsh $USER -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "soruce ~/.zshrc"

# mkdir -p $ZSH_CUSTOM/themes
# wget https://github.com/ChesterYue/ohmyzsh-theme-passion/blob/11b1a03575ac826646ec438f6390a077a0bd85d4/passion.zsh-theme
# mv passion.zsh-theme $ZSH_CUSTOM/themes
# echo ZSH_THEME="passion" >> ~/.zshrc
# echo source ~/.zshrc