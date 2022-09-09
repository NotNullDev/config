#!/bin/bash

curl -Lo golang https://get.golang.org/Linux && chmod +x ./golang && ./golang && rm ./golang
echo "source ~/.zshrc"