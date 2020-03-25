##
## EPITECH PROJECT, 2019
## {EPITECH}projects
## File description:
## arch_config.sh
##

#!bin/bash

green='\e[0;32m'
red='\e[0;31m'
neutral='\e[0;m'
clear
echo -e "${red}[-------SETUP ARCHLINUX LVM-------]${neutral}"
loacalectl -setkeymap --no-convert fr
timedatectl set-ntp true
lsblk
echo -e "${green}DISK PARTITIONING${neutral}\n"
echo -e "${red}Enter the path you want to use.\n${neutral}"
read -p "Path (default /dev/sda): " input
if [ "$input" = "" ]
then
    fdisk /dev/sda
else
    fdisk $input
fi
if [ "$input" = "" ]
then
    path="/dev/sda1"
else
    path="${input}1"
fi
pvcreate $path
vgcreate vg1 $path
clear
echo -e "${green}CREATION OF LOGICAL VOLUMES\n${neutral}"
read -p "Enter the boot volume size: " size
lvcreate -L $size -n boot vg1
read -p "Enter the size of the root volume: " size
lvcreate -L $size -n root vg1
read -p "Enter the size of the home volume: " size
lvcreate -L $size -n home vg1
read -p "Enter the size of the swap volume: " size
lvcreate -L $size -n swap vg1
mkfs.ext2 /dev/vg1/boot
mkfs.ext4 /dev/vg1/root
mkfs.ext4 /dev/vg1/home
mkswap /dev/vg1/swap
swapon /dev/vg1/swap
mount /dev/vg1/root /mnt
mkdir /mnt/boot
mount /dev/vg1/boot /mnt/boot
mkdir /mnt/home
mount /dev/vg1/home /mnt/home
clear
echo -e "${red}BASIC SYSTEM INSTALLATION\n${neutral}"
sleep 6
mv ./mirrorlist /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
mv mkinitcpio.conf /mnt
mv arch_setup.sh /mnt/root
mv linux_config.sh /mnt
echo -e "${red}PLEASE LAUNCH linux_config.sh AFTER THE LAUNCH OF BASH\n${neutral}"
sleep 6
arch-chroot /mnt /bin/bash