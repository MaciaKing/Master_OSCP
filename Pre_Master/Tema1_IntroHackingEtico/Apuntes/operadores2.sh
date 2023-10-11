#!/bin/bash

fichero=$1
palabraBuscada=$2

texto=$(cat $fichero)
[[ "$texto" == *$palabraBuscada* ]]
echo $?

