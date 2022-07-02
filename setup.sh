#!/bin/bash

source variables.sh

./wifi_setup.sh
./package_setup.sh
./yay_setup.sh
./ssd_setup.sh
./snapper_setup.sh
./git_setup.sh
./dotfiles_setup.sh
