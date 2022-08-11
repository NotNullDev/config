#!/bin/bash
# https://unix.stackexchange.com/questions/12902/how-to-run-find-exec
find . \
-name 'node_modules' \
-type d \
-prune `#dont go deeper than node_modules` \
-exec rm -rf '{}' + `#delete found folder`