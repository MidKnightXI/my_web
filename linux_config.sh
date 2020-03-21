##
## EPITECH PROJECT, 2019
## script_archlinux_config
## File description:
## linux_config.sh
##

#!bin/bash

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
pacman -S GRUB
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
echo -e "${rouge}-------FIN DE CONFIGURATION-------\n\n${neutre}"
echo -e "veuillez enlever votre disque d'installation après l'extinction de la machine et le mode d'accès réseau en accès par ponts.\n"
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