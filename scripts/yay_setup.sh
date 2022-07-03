#!/bin/bash

sudo pacman -S git
yay_dir=/home/"$user"/yay

if [ ! -d "$yay_dir" ]; then
	cwd=$PWD
	git clone https://aur.archlinux.org/yay "$yay_dir"
	cd "$yay_dir"
	makepkg -si
	cd "$cwd" 
fi
