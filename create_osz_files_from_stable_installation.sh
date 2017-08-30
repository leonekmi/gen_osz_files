#!/bin/bash
for d in */
do
    tput setaf 2
    echo "Processing ${d::-1}"
    tput sgr 0
    ( cd "$d" && zip -r "${d::-1}.osz" * && mv "${d::-1}.osz" ../ )
done
