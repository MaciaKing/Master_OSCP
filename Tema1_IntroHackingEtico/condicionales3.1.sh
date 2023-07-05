#!/bin/bash


echo "TITULO $0"
echo "--------------------"
echo "1) listar fichero /etc/passwd"
echo "2) listar directorio /etc"
echo "3) comprobar existencia directorio /var/log"
echo "4) comprobar existencia usuario"
echo "5) exit"


#Switch case
echo -n "introduce opcion: "
read opcion

case $opcion in
	1) 
		cat /etc/passwd
		;; 
	2)	
		ls /etc
		;;
	3)
		if [ -d $log]
		then 
			echo "existe el directorio"
		else 
			echo "no existe el directorio"
		fi
		;;
	4)
		echo -n "Introduce el nombre de usuario: "
		read username
		cat /etc/passwd | grep $username		
		if [ $? -eq 0 ]		
		then
			echo "El usuario existe"
		else
			echo "El usuario no existe"
		fi
		;;
	5)
		exit
		;;
	*)
		echo "Has introducido una opcion no valida"
		;;
esac

