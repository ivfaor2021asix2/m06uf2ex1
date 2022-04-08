#!/bin/bash
clear
if (( EUID != 0 ))
then
	echo "Aquest script ha de ser executat com a root"
	exit 1
fi
echo -n "Donam el nom del directori a crear a /var :"
read directori

if [ -d /var/$directori ] && [ ! -L /var/$directori ]
then
	echo "El directori ja existeix"
	exit 2
else
	mkdir /var/$directori
	cp /etc/ssh/sshd_config /var/$directori
	cp /etc/cups/cupsd.conf /var/$directori
	echo "Fitexrs copiats"
echo -n "Vols continuar? SI [y] | NO [n]: "
read opt

if  [[  $opt  ==  "y"  ]]
then
    ( exec "./p2.sh" )
else
    exit 1
fi

fi
exit 5
