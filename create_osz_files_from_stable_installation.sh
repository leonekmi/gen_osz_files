#!/usr/bin/sh
for d in */
do
    ( cd "$d" && zip -r "${d::-1}.osz" * && mv "${d::-1}.osz" ../ )
done
