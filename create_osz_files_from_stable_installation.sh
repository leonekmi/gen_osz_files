#!/usr/bin/sh
for d in */
do
    echo "Processing ${d::-1}"
    ( cd "$d" && zip -r "${d::-1}.osz" * && mv "${d::-1}.osz" ../ )
done
