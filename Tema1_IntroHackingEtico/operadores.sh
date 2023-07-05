#!/bin/bash

resultado=$((10*70))
echo "$resultado"

var1=30
var2=300

test $var1 -eq $var2 
echo "$? No son iguales"

test $var1 -eq $var1
echo "$? Son iguales"

test $var1 -ge $var2 
echo "$? Falso, $var1 no es mayor o igual a $var2"

[$var1 -eq $var2]
echo "$? No son iguales"

var1="SoyUnSubstringABuscar, me encuentras?"
[["$var1" == *"me"* ]]
echo "$? Encontrado"

[["$var1" == *"no"*]]
echo "$? No hay nada a encontrar"
