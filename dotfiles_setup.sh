#!/bin/bash

git clone https://github.com/kappamalone/dotfiles /home/"$user"/dotfiles
cd /home/"$user"/dotfiles
chmod +x setup.sh
./setup.sh
