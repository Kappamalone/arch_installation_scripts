#!/bin/bash

# create snapper root config
if [ ! -f '/etc/snapper/configs/root' ]; then
	umount /.snapshots
	rm -r /.snapshots
	snapper -c root create-config /
	btrfs subvolume delete /.snapshots
	mkdir /.snapshots
	mount -a
	chmod 750 /.snapshots
fi

# copy over snapper config and give current user permissions
cp -f configs/snapper/root /etc/snapper/configs/root
sed -i 's/ALLOW_USERS=""/ALLOW_USERS="'"$SUDO_USER"'"/g' /etc/snapper/configs/root 
systemctl enable --now snapper-timeline.timer
systemctl enable --now snapper-cleanup.timer

# install and configure grub-btrfs
sed -i 's/#GRUB_BTRFS_SHOW_SNAPSHOTS_FOUND/GRUB_BTRFS_SHOW_SNAPSHOTS_FOUND/' /etc/default/grub-btrfs/config
systemctl enable --now grub-btrfs.path

