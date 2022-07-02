#!/bin/bash

# moves these scripts onto the system after archisntallation completes

mount -o subvolid=5 /dev/"$root_partition" /mnt
mv arch_installation_scripts/ /mnt/home/"$user"/
