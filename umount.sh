##
## EPITECH PROJECT, 2019
## script_archlinux_config
## File description:
## unmount.sh
##

#!bin/bash

green='\e[0;32m'
red='\e[0;31m'
neutral='\e[0;m'
umount -R /mnt
clear
echo -e "${red}\nAfter switching off the machine:\n${green}Please remove the installation disk and change the network access mode to bridged.\n\n${neutral}"
sleep 3
echo -e "${red}On reboot:\n${green}Please run arch_setup.sh to complete the installation.\n\n${neutral}"
sleep 7
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