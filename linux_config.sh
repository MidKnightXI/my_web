##
## EPITECH PROJECT, 2019
## script_archlinux_config
## File description:
## linux_config.sh
##

#!bin/bash

vert='\e[0;32m'
rouge='\e[0;31m'
neutre='\e[0;m'
pacman -S nano
clear
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
clear
echo -e "${rouge}INSTALLATION DE LINUX\n${neutre}"
sleep 6
mv mkinitcpio.conf /etc
pacman -S lvm2
mkinitcpio -p linux
clear
echo -e "${rouge}INSTALLATION DE GRUB\n${neutre}"
pacman -S grub
if [ "$input" = "" ]
then
    grub-install --target=i386-pc /dev/sda
else
    grub-install --target=i386-pc $input
fi
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S iw wpa_supplicant dialog
pacman -S networkmanager
clear
read -p "Entrez le nom de votre machine:" hostname
echo $hostname >> /etc/hostname
echo -e "${vert}Entrez votre mot de passe root\n${neutre}"
passwd
clear
echo -e "${vert}Veuillez lancer unmount.sh\n${neutre}"
sleep 4
exit