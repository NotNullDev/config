#!/bin/bash
echo ssh $USER@$(ip a | grep 'inet.*eth1' | awk '{print $2}' | cut -d '/' -f1)