#!/bin/bash
RESETCOLOR="\033[00m"
BLUE="\e[0;36m"
RED="\e[0;91m"
GREEN="\e[0;32m"

iterate_folder(){
    cd $2
    for file in $1*; do 
        echo -e "${BLUE}  [INFO]${RESETCOLOR} Renaming ${file} to ${file#$1}."
        mv "$file" "${file#$1}" 
    done
}
if [ -z "$1" ]; then
    echo -e "${RED}  [ERROR]${RESETCOLOR} Please enter a valid prefix."
    exit 1;
else
    PREFIX_REMOVE=$1
    if [ -z "$2" ]; then
    echo -en "${BLUE}Enter folder path (press enter to use $(pwd))${RESETCOLOR} "
    read FLD_PATH
        if [ FLD_PATH == "" ] || [ -z "$FLD_PATH" ]; then
            FLD_PATH=$(pwd)
        fi
    else
        FLD_PATH=$2
    fi
    iterate_folder $PREFIX_REMOVE $FLD_PATH
    echo -e "${GREEN}That's it! ${RESETCOLOR}"
    exit 0
fi 