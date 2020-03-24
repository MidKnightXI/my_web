##
## EPITECH PROJECT, 2019
## script_archlinux_config
## File description:
## linux_config.sh
##

#!bin/bash

green='\e[0;32m'
red='\e[0;31m'
neutral='\e[0;m'
pacman -S nano
clear
echo -e "${red}SET UP LOCALE && TIME\n${neutral}"
echo -e "${green}Uncomment *en_US.UTF-8* or any other locale that you want to use."
sleep 5
nano /etc/locale.gen
locale-gen
read -p "Enter the name of the selected locale: " locale
echo LANG=$locale >> /etc/locale.conf
tzselect
ln -s /usr/share/zoneinfo/Zone/SubZone /etc/localtime
hwclock --systohc --utc
clear
echo -e "${red}LINUX INSTALLATION\n${neutral}"
sleep 6
mv mkinitcpio.conf /etc
pacman -S lvm2
mkinitcpio -p linux
clear
echo -e "${red}GRUB INSTALLATION\n${neutral}"
pacman -S grub
if [ "$input" = "" ]
then
    grub-install --target=i386-pc /dev/sda
else
    grub-install --target=i386-pc $input
fi
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S iw wpa_supplicant dialog networkmanager
clear
read -p "Enter the name of your machine: " hostname
echo $hostname >> /etc/hostname
echo -e "${green}Enter your root password\n${neutral}"
passwd
clear
echo -e "${green}Please run the exit command, then execute the umount.sh script.\n${neutral}"
sleep 4
exit