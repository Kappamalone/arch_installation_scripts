#!/bin/bash

if [ ! -d '~/yay' ]; then
	cwd=$PWD
	mkdir /home/"$user"/yay
	git clone https://aur.archlinux.org/yay /home/"$user"/yay
	cd /home/"$user"/yay
	makepkg -si 
	cd "$cwd" 
fi
