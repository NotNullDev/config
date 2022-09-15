#!/bin/bash

if [[ "$0" -eq "-zsh"  ]]
then
echo "Installing zsh autocompletions"
kubectl completion zsh >> ~/.zshrc
kubeadm completion zsh >> ~/.zshrc
source ~/.zshrc
elif [[ "$0" -eq "bash" ]]
then
echo "Installing bash autocompletions"
kubectl completion bash >> ~/.bashrc  
kubeadm completion bash >> ~/.bashrc
source ~/.bashrc           
else
then
    echo "Could not install autocompletions."
fi