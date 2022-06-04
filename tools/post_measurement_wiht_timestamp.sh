#!/bin/bash
#Usage: 1.- ID
#       2.- key
#       3.- temperatura
#       4.- humedad
TIMESTAMP=$(date +%s)
STR="ts="$TIMESTAMP"&id=$1&key=$2&t=$3&h=$4"
echo "Sending Data: "$STR
wget -O - --method=POST http://localhost:8080/measurement --body-data=$STR
