#!/bin/bash

if [ ! -d ~/dotfiles ]; then
	cwd=$PWD
	git clone https://github.com/kappamalone/dotfiles ~/dotfiles
	cd ~/dotfiles
	chmod +x setup.sh
	./setup.sh
	cd "$cwd" 
fi

