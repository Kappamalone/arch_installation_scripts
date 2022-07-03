#!/bin/bash

# setup git config

git config --global user.name "$git_username"
git config --global user.email "$git_email"
gh auth login --with-token < token.txt
gh auth setup-git
