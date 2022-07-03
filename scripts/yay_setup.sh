#!/bin/bash

if [ ! -d ~/yay ]; then
	cwd=$PWD
	git clone https://aur.archlinux.org/yay ~/yay 
	cd ~/yay 
	makepkg -si
	cd "$cwd" 
fi

yay -S github-cli paleofetch-git snapper-rollback
