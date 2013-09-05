#!/bin/bash
# This runs as root on the server

chef_binary=/var/lib/gems/1.9.1/bin/chef-solo

# Are we on a fresh instance?
# if ! test -f "$chef_binary"; then
#    export DEBAIN_FRONTEND=noninteractive
#    # Upgrade headlessly (this is the only safe-ish on fresh instances)
#    aptitude update &&
#    apt-get -o Dpkg::Options::="--force-confnew" \
#        --force-yes -fuy dist-upgrade &&
#    # install ruby and chef
#    aptitude install -y ruby1.9.1 ruby1.9.1-dev make &&
#    sudo gem1.9.1 install --no-rdoc --no-ri chef --version 0.10.0
# fi &&

# "$chef_binary" -c solo.rb -j solo.json