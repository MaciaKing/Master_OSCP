#!/bin/bash

numero=$1

echo $PATH | awk -F: "{print $`echo $numero`}"
