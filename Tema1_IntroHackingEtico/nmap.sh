#!/bin/bash

show_menu(){
	echo 
	echo
	echo "nmap for begginers"
	echo "===================="
	echo "1) nmap basic execution"
	echo "2) nmap dicovery host based ARP"
	echo "3) nmap discovery ping sweer (not ARP)"
	echo "4) nmap port scann (SYN SCAN)"
	echo "5) nmap -A (all functions)"
	echo "6) exit"
	echo -n "opcion: "
}

mensajes(){
	if [ $# -ne 1 ]
	then
		echo "[mensajes]Falta argumento"
	fi

	mensaje=$1
	case $mensaje in 
		0)
		      	echo	
			echo -n "Introduce direccion IP: "
			;;
		1)	
			echo
			echo -n "Introduce un puerto o rango de puertos: "
			;;
		*)
			;;
	esac
}

read_ip(){
	read ip
	echo $ip
}

read_puerto(){
	read port
	echo $port
}

elige_opcion(){
	local opcion=$1
	case $opcion in
		1)
			mensajes 0
			ip=$(read_ip)
			nmap $ip
			;;
		2)
			mensajes 0
			ip=$(read_ip)
			nmap -sn -PR $ip
			;;
		3)
			mensajes 0
			ip=$(read_ip)
			nmap -sP $ip --disable-arp-ping
			;;
		4)
			mensajes 0 
			ip=$(read_ip)
			mensajes 1
			port=$(read_port)
			nmap -p $port -sS $ip
			;;
		5)	
			mensajes 0
			ip=$(read_ip)
			nmap -A $ip
			;;
		6) 
			exit
			;;
	esac
}

if [ $# -ne 0 ] 
then 
	echo "No tiene parametros"
fi

sigue=1
while [ $sigue -eq 1 ]
do
	show_menu
	read opcio
	elige_opcion $opcio
done

