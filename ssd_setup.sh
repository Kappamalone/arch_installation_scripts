#!/bin/bash


# Set custom btrfs mount options
mount_options='defaults,noatime,ssd,space_cache=v2,compress-force=zstd:1'
sed -i 's/rw,relatime,ssd,space_cache=v2/'"$mount_options"'/g' /etc/fstab 

# Setup swapfile on separate subvolume
root_partition=''
UUID=''
swap_size=8192 # size of swapfile in megabytes

mount /dev/"$root_partition" /mnt
btrfs subvolume create /mnt/@swap
umount /mnt
mkdir /swap
mount -o subvol=@swap /dev/"$root_partition" /swap
touch /swap/swapfile
chmod 600 /swap/swapfile
chattr +C /swap/swapfile
sudo dd if=/dev/zero of=/swap/swapfile bs=1M count="$swap_size"
mkswap /swap/swapfile
swapon /swap/swapfile

echo "UUID=$UUID /swap btrfs defaults,noatime,subvol=@swap 0 0" >> /etc/fstab
echo "/swap/swapfile none swap sw 0 0" >> /etc/fstab

# Setup weekly fstrim
systemctl enable --now fstrim.timer
