#!/bin/bash

files=$(find jobs -name "config.xml" -type f)
for file in $files
do
    # cut two first characters using sed command
    # and copy file to output folder
    fileWithDir=$(echo $file | sed 's/..//)
    sudo cp "$fileWithDir" "/home/$USER/config"
done;