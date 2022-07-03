#!/bin/bash

# create snapper root config
if [ ! -f '/etc/snapper/configs/root' ]; then
	sudo umount /.snapshots
	sudo rm -r /.snapshots
	sudo snapper -c root create-config /
	sudo btrfs subvolume delete /.snapshots
	mkdir /.snapshots
	sudo mount -a
	sudo chmod 750 /.snapshots
fi

# copy over snapper config and give current user permissions
sudo cp -f configs/snapper/root /etc/snapper/configs/root
sudo sed -i 's/ALLOW_USERS=""/ALLOW_USERS="'"$user"'"/g' /etc/snapper/configs/root 
sudo systemctl enable --now snapper-timeline.timer
sudo systemctl enable --now snapper-cleanup.timer

# configure grub-btrfs
sudo sed -i 's/#GRUB_BTRFS_SHOW_SNAPSHOTS_FOUND/GRUB_BTRFS_SHOW_SNAPSHOTS_FOUND/' /etc/default/grub-btrfs/config
sudo sed -i 's/#GRUB_BTRFS_IGNORE_SNAPSHOT_TYPE=("")/GRUB_BTRFS_IGNORE_SNAPSHOT_TYPE=("pre" "post")/' /etc/default/grub-btrfs/config

sudo systemctl enable --now grub-btrfs.path

