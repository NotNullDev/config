#!/bin/bash

function findRecursive() {
    path=$1
    outputFolder=$2

    # loop thorught directories in path and look for file config.xml
    for file in $path/*; do
        if [ -d "$file" ]; then
            findRecursive "$file"
        elif [ -f "$file" ]; then
            if [ "$file" == "config.xml" ]; then
                echo "Found config.xml in $path"
                # copy config.xml to outputFolder
                sudo cp "$file" "$outputFolder"
            fi
            fi
        fi
    done
}

findRecursive "/home/user" "/home/user/output"