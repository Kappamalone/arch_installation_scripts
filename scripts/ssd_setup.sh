#!/bin/bash


# Set custom btrfs mount options
archinstall_mount_options='rw,relatime,ssd,space_cache=v2' # double check /etc/fstab to make sure these are the default mount options
custom_mount_options='defaults,noatime,ssd,space_cache=v2,compress-force=zstd:1'
sudo sed -i 's/'"$archinstall_mount_options"'/'"$custom_mount_options"'/g' /etc/fstab 

# Setup swapfile on separate subvolume

swapAlreadyCreated=$(cat /etc/fstab | grep -c "UUID=$UUID /swap btrfs defaults,noatime,subvol=@swap 0 0")

if [ $swapAlreadyCreated -eq 0 ] && [ ! -z $UUID ]; then
	sudo mount "$root_partition" /mnt
	sudo btrfs subvolume create /mnt/@swap
	sudo umount /mnt
	sudo mkdir /swap
	sudo mount -o subvol=@swap "$root_partition" /swap
	sudo touch /swap/swapfile
	sudo chmod 600 /swap/swapfile
	sudo chattr +C /swap/swapfile
	sudo dd if=/dev/zero of=/swap/swapfile bs=1M count="$swap_size"
	sudo mkswap /swap/swapfile
	sudo swapon /swap/swapfile

	echo "UUID=$UUID /swap btrfs defaults,noatime,subvol=@swap 0 0" | sudo tee -a /etc/fstab
	echo "/swap/swapfile none swap sw 0 0" | sudo tee -a /etc/fstab
fi

# Setup weekly fstrim
sudo systemctl enable --now fstrim.timer
