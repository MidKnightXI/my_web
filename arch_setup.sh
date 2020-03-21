##
## EPITECH PROJECT, 2019
## {EPITECH}projects
## File description:
## arch_setup.sh
##

#!/bin/bash

vert='\e[0;32m'
rouge='\e[0;31m'
neutre='\e[0;m'
NetworkManager
systemctl enable NetworkManager
systemctl start NetworkManager
pacman -S xfce4 xorg gdm xf86-input-synaptics
systemctl enable gdm
lspci | grep VGA
echo -e "${vert}Recherchez le nom du driver correspondant au matériel ci-dessus\n${neutre}"
sleep 1
read -p "Entrez le nom du driver en question: " driver
pacman -S $driver
read -p "Souhaitez vous installer SSH (Y/n): " SSH
if [ "$SSH" = "Y"]
then
    pacman -S opensh
elif ["$SSH" = "y"]
then
    pacman -S opensh
elif ["$SSH" = "n"]
then
    fi
fi
echo -e "${rouge}-------FIN DE CONFIGURATION-------\n\n${neutre}"
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