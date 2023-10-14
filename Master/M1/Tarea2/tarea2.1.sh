#!/bin/bash
# $1 --> hash to break
# $2 --> wordlist

#Comprobamos que el fichero tenga dos entradas
if [ $# -ne 2 ]
then 
        echo "ERROR: $0 <hashes> <diccionario>"
        exit
fi

#Comprobamos que los dos ficheros de entradas
#sean ficheros que existen
if [ ! -f "$1" ]
then 
        echo "ERROR: $0 $1 $2 --> $1 no es un fichero"
        exit
fi

if [ ! -f "$2" ]
then
        echo "ERROR: $0 $1 $2 --> $2 no es un fichero"
        exit
fi

#ver resultados
echo
echo "Desencriptando... Puede tardar algunos minutos.."
john --wordlist="$2" --format=Raw-SHA256 $1
#Obtener las passw
echo
echo "Contrasenas desencriptadas... "
john --show --format=Raw-SHA256 $1