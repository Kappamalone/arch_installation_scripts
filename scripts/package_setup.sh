#!/bin/bash

# install packages needed for all scripts to run

sudo pacman -S --needed base-devel
sudo pacman -S util-linux git snapper grub-btrfs snap-pac reflector man-db man-pages
