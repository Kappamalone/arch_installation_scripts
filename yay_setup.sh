#!/bin/bash

if [ ! -d '~/yay' ]; then
	cwd=$PWD
	mkdir ~/yay
	git clone https://aur.archlinux.org/yay ~/yay
	cd ~/yay
	makepkg -si 
	cd "$cwd" 
fi
