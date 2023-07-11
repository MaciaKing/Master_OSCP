#!/bin/bash

#Switch case
echo -n "introduce opcion: "
read opcion

case $opcion in
	1) 
		echo "Has introducido el valor 1"
		;;
	*)	
		echo "No has introduciodo opcion valida"
esac

