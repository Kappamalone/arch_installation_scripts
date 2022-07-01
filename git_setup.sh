#!/bin/bash

yay -S github-cli

# setup git config
username='kappamalone'
email='uzman.zawahir1@gmail.com'

git config --global user.name "$username"
git config --global user.email "$email"

