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
cat README.md
sleep 5
clear
echo -p "${rouge}[-------SETUP ARCHLINUX LVM-------]${neutre}"
timedatectl set-ntp true
lsblk
echo -e "${vert}PARTIONNEMENT DU DISQUE${neutre}\n"
echo -e "${rouge}Entrez le chemin que vous voulez utiliser.\n${neutre}"
read -p "chemin (default /dev/sda):" input
if [ "$input" = ""]
    fdisk /dev/sda
    else
        fdisk $input
fi
path="${input}1"
pvcreate $path
vgcreate vg1 $path
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
echo -e "${vert}Supprimez tous les serveurs jusqu'à en avoir ~3 FR\n${neutre}"
echo -e "PS: le premier miroir FR est cassé, donc enlevez le de la liste\n"
sleep 4
nano /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash
pacman -S nano
echo -e "${rouge}SET UP LOCALE && TIME\n${neutre}"
echo -e "${vert}Décommentez *en_US.UTF-8* ou n'importe quelle autre locale dont vous avez besoin"
sleep 5
nano /etc/locale.gen
locale-gen
read -p "Entrez le nom de la locale sélectionnée:" locale
echo $locale >> /etc/locale.conf
tzselect
ln -s /usr/share/zoneinfo/Zone/SubZone /etc/localtime
hwclock --systohc --utc
echo -e "${vert}Ajoutez ${neutre}lvm2${vert} au hook juste avant ${neutre}filesystems"
sleep 5
nano /etc/mkinitcpio.conf
pacman -S lvm2
mkinitcpio -p linux
echo -e "${rouge}INSTALLATION DE GRUB\n${neutre}"
pacman -S GRUB
if [ "$input" = ""]
    grub-install --target=i386-pc /dev/sda
else
    grub-install --target=i386-pc $input
fi
grub-mkconfig -o /boot/grub/grub.cfg
read -p "Entrez le nom de votre machine:" hostname
echo $hostname >> /etc/hostname
pacman -S iw wpa_supplicant dialog
pacman -S networkmanager
echo -e "${vert}Entrez votre mot de passe root\n${neutre}"
passwd
echo -e "${rouge}-------FIN DE CONFIGURATION-------\n\n${neutre}"
echo -e "veuillez enlever votre disque d'installation après l'extinction de la machine.\n"
sleep 3
echo -e "Après le redémarrage de votre machine veuiller exécuter arch_setup.sh.\n\n"
exit
umount -R /mnt
clear
echo -e "${rouge}-------EXTINCTION IMMINENTE-------\n\n${neutre}"
sleep 1
clear
echo -e "${rouge}-------EXTINCTION IMMINENTE .-------\n\n${neutre}"
sleep 1
clear
echo -e "${rouge}-------EXTINCTION IMMINENTE ..-------\n\n${neutre}"
sleep 1
clear
echo -e "${rouge}-------EXTINCTION IMMINENTE ...-------\n\n${neutre}"
shutdown now