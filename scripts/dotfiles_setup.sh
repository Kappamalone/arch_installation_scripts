#!/bin/bash

dotfiles_dir=/home/"$user"/dotfiles
cwd=$PWD

if [ ! -d "$dotfiles_dir" ]; then
	git clone https://github.com/kappamalone/dotfiles "$dotfiles_dir" 
	cd "$dotfiles_dir"
	chmod +x setup.sh
	./setup.sh
fi

cd "$cwd" 
