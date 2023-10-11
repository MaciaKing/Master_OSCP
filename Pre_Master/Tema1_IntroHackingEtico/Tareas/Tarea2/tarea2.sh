#!/bin/bash

show_menu(){
	echo 
	echo
	echo "nmap for begginers"
	echo "===================="
	echo "1) metasploit"
	echo "2) dirbuster"
	echo "3) nmap"
	echo "4) shell en un puerto (netcat)"
	echo "5) connect shell remote (netcat)"
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
			msfconsole
			;;
		2)
			dirbuster
			;;
		3)
			mensajes 0
			ip=$(read_ip)
			nmap -sC -sV $ip
			;;
		4)
			mensajes 1
			port=$(read_puerto)
			nc -l -p $port
			;;
		5)
			# connect to somewhere:   nc [-options] hostname port[s] [ports] ...
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

