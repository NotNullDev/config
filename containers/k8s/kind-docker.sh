# docker
curl get.docker.com | sudo bash
sudo usermod -aG docker $USER && newgrp docker

# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    # completion
    cat ~/.zshrc > /dev/null && kubectl completion zsh >> ~/.zshrc && source ~/.zshrc
    cat ~/.bashrc > /dev/null && kubectl completion bash >> ~/.bashrc && source ~/.bashrc
    # cleanup
    rm ./kubectl

# kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.14.0/kind-linux-amd64
chmod +x ./kind
mv ./kind /user/bin/kind

cat ~/.zshrc > /dev/null && kind completion zsh >> ~/.zshrc && source ~/.zshrc
cat ~/.bashrc > /dev/null && kind completion bash >> ~/.bashrc && source ~/.bashrc