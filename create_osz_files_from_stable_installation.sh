#!/bin/bash
# Generate .osz files from a valid Songs/ folder
# (c) 2017 leonekmi - The Unlicense
confirm() {
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            exit
            ;;
    esac
}
echo "Hi, this script will generate .osz from ALL beatmaps in Songs/ folder (you must cd in the Songs/ folder or it will not work)"
confirm "Are you into Songs/ folder ? [y/N]"
FOLDERS="$(ls -l | grep -c ^d)"
echo "${FOLDERS} beatmaps detected, processing all"
sleep 1
mkdir osz
for d in */
do
    if [ "$d" != "osz/" ]
    then
        tput setaf 2
        echo "Processing ${d::-1}"
        tput sgr 0
        ( cd "$d" && zip -r "${d::-1}.osz" * && mv "${d::-1}.osz" ../osz )
    fi
done
tput setaf 2
echo "Done ! All beatmaps are processed and are in osz/ folder created just now ! (Note : don't run osu! to avoid re-processing of beatmaps, move the folder elsewhere)"
tput sgr 0
