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
echo -e "${red}After switching off the machine, please remove the installation disk and change the network access mode to bridged.\n\n${neutral}"
sleep 2
echo -e "${red}On reboot, please run arch_setup.sh to complete the installation.\n\n${neutral}"
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