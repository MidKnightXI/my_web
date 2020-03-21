##
## EPITECH PROJECT, 2019
## {EPITECH}projects
## File description:
## arch_config.sh
##

#!bin/bash

vert='\e[0;32m'
rouge='\e[0;31m'
neutre='\e[0;m'
clear
echo -e "${rouge}[-------SETUP ARCHLINUX LVM-------]${neutre}"
timedatectl set-ntp true
lsblk
echo -e "${vert}PARTIONNEMENT DU DISQUE${neutre}\n"
echo -e "${rouge}Entrez le chemin que vous voulez utiliser.\n${neutre}"
read -p "Chemin (default /dev/sda):" input
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
echo -e "${vert}CREATION DES VOLUMES LOGIQUES\n${neutre}"
read -p "Entrez la taile du volume boot:" size
lvcreate -L $size -n boot vg1
read -p "Entrez la taile du volume root:" size
lvcreate -L $size -n root vg1
read -p "Entrez la taile du volume home:" size
lvcreate -L $size -n home vg1
read -p "Entrez la taile du volume swap:" size
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
echo -e "${rouge}INSTALLATION DU SYSTEME DE BASE\n${neutre}"
sleep 6
mv ./mirrorlist /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
mv mkinitcpio.conf /mnt
mv arch_setup.sh /mnt
mv linux_config.sh /mnt
echo -e "${rouge}VEUILLEZ LANCER linux_config.sh APRES LE LANCEMENT DE BASH\n${neutre}"
sleep 6
arch-chroot /mnt /bin/bash