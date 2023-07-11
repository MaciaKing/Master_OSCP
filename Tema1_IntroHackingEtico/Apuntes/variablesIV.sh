#!/bin/bash

numero=$1

echo $PATH | cut -f$numero -d':'
