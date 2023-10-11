#!/bin/bash

var1=30
var2=30
var3=10

[[ "$var1" == *$var2* ]]
echo $?

test $var1 -eq $var2 && test $var1 -eq $var3
echo $?
