# docker
curl get.docker.com | sudo bash
sudo usermod -aG docker $USER && newgrp docker

# mininkube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
    # completion
    cat ~/.zshrc > /dev/null && minikube completion zsh >> ~/.zshrc && source ~/.zshrc
    cat ~/.bashrc > /dev/null && minikube completion bash >> ~/.bashrc && source ~/.bashrc


# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    # completion
    cat ~/.zshrc > /dev/null && kubectl completion zsh >> ~/.zshrc && source ~/.zshrc
    cat ~/.bashrc > /dev/null && kubectl completion bash >> ~/.bashrc && source ~/.bashrc

# cleanup
rm ./minikube* ./kubectl

# cut off ssh
#sudo iptables -t nat -A PREROUTING -d 192.168.0.228 -j DNAT --to-destination 192.168.49.2
#sudo iptables -t nat -A POSTROUTING -s 192.168.49.2 -j SNAT --to-source 192.168.0.228