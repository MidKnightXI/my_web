##
## EPITECH PROJECT, 2019
## script_archlinux_config
## File description:
## unmount.sh
##

#!bin/bash

vert='\e[0;32m'
rouge='\e[0;31m'
neutre='\e[0;m'
umount -R /mnt
clear
echo -e "${rouge}Après l'extinction de la machine, veuillez enlever le disque d'installation et passer le mode d'accès réseaux en accès par ponts\n\n${neutre}"
sleep 2
echo -e "${rouge}Au redémarrage, veuillez exécuter arch_setup.sh pour finaliser l'installation\n\n${neutre}"
sleep 7
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