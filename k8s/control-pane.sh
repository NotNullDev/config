#!/bin/bash

mkdir -p ./logs

timestamp=$(date +%s)

log_file_path="./logs/cpane-$timestamp.log"

echo "Created logs file at:"
echo "cat $log_file_path"
printf "\n"
bash ./.control-pane.sh | sudo tee $log_file_path