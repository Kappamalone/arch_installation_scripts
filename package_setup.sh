#!/bin/bash

# install packages needed for all scripts to run

pacman -S --needed base-devel
pacman -S util-linux neovim git snapper grub-btrfs snap-pac
yay -S github-cli paleofetch-git
