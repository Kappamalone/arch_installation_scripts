#!/bin/bash

# install yay and github-cli
git clone https://github.com/kappamalone/dotfiles ~/dotfiles
iaur yay
yay -S github-cli

# setup git config
username='kappamalone'
email='uzman.zawahir1@gmail.com'

git config --global user.name "$username"
git config --global user.email "$email"
gh auth login --with-token < token.txt 

