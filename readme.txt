First install ansible:
sudo apt update && sudo apt install ansible

(nice to have [passwordless sudo])
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER

usage:
    ansible-playbook <filename>


oh-my-zsh (after installation ):
    ansible-playbook ./configure-zsh

docker:
    ansible-playbook ./install-docker.yml

nice to have utils:
    ansible-playbook ./install-utils.yml