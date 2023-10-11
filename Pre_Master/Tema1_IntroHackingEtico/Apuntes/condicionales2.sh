#!/bin/bash

#Comprobamos que al script lleguen 2 argumentos
if test $# -ne 2
then 
	echo "Error, el script $0 <var 1> <var 2>"
	exit
fi

