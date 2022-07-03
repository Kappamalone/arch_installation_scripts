#!/bin/bash

source ./variables.sh
. scripts/wifi_setup.sh
. scripts/yay_setup.sh 
. scripts/package_setup.sh
. scripts/reflector_setup.sh
. scripts/ssd_setup.sh
. scripts/snapper_setup.sh
. scripts/git_setup.sh
. scripts/dotfiles_setup.sh 

echo "Done! You should probably reboot now"
