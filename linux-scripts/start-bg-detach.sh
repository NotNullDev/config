#!/bin/bash

# run silently
firefox </dev/null &>/dev/null &

firefox &

disown

# alternative
nohup firefox &