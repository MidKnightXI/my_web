##
## EPITECH PROJECT, 2019
## {EPITECH}projects
## File description:
## arch_setup.sh
##

#!/bin/bash

green='\e[0;32m'
red='\e[0;31m'
neutral='\e[0;m'
NetworkManager
systemctl enable NetworkManager
systemctl start NetworkManager
read -p "Would you like to install SSH (Y/n): " SSH
if [ "$SSH" = "" ]
then
    pacman -S openssh
elif [ "$SSH" = "Y" ]
then
    pacman -S openssh
elif [ "$SSH" = "y" ]
then
    pacman -S openssh
fi
clear
read -p "Would you like to install Sudo (Y/n): " sudo
if [ "$sudo" = "" ]
then
    pacman -S sudo
elif [ "$sudo" = "Y" ]
then
    pacman -S sudo
elif [ "$sudo" = "y" ]
then
    pacman -S sudo
fi
pacman -S xfce4 xfce-goodies xorg-server gdm
systemctl enable gdm
clear
lspci | grep VGA
echo -e "${green}Look for the name of the driver corresponding to the hardware above.\n${neutral}"
sleep 1
read -p "Enter the name of the driver concerned: " driver
pacman -S $driver
clear
echo -e "${green}-------CONFIGURATION COMPLETE-------\n${neutral}"
sleep 7
clear
echo -e "${red}-------END OF CONFIGURATION-------\n\n${neutral}"
clear
echo -e "${red}-------IMMINENT EXTINCTION-------\n\n${neutral}"
sleep 1
clear
echo -e "${red}-------IMMINENT EXTINCTION .-------\n\n${neutral}"
sleep 1
clear
echo -e "${red}-------IMMINENT EXTINCTION ..-------\n\n${neutral}"
sleep 1
clear
echo -e "${red}-------IMMINENT EXTINCTION ...-------\n\n${neutral}"
shutdown now