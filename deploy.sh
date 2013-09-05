#!/bin/bash
# This script is used to push out the configurations

# Usage: ./deploy.sh  $1 = [host]

# The host key might change when we instantiate a new slice,
# so we remove (-R) the old host key from known_hosts
host = $1
ssh-keygen -R "${host#*@}" 2> /dev/null

tar cj . | ssh -o 'StrictHostKeyChecking no' "$host" '
sudo rm -rf ~/chef &&
mkdir ~/chef &&
cd ~/chef &&
tar xj &&
sudo bash install.sh'