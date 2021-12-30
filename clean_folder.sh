#!/bin/bash
RESETCOLOR="\033[00m"
BLUE="\e[0;36m"
RED="\e[0;91m"
GREEN="\e[0;32m"
openFILE (){
  echo -e "${GREEN}Opening $1${RESETCOLOR}"
  if ! command -v xdg-open &> /dev/null
  then
    open $1
  else
    xdg-open $1
  fi
}

clean_folder (){
  cd $1
  for i in *.*; do
    echo -en "${BLUE}Open $i? (y/N)${RESETCOLOR} "
    read OPTION;
    if [ $OPTION == "y" ] || [ $OPTION == "Y" ];then
      openFILE "$1/$i"
    fi
    echo -en "${RED}Delete file $i? (y/N)${RESETCOLOR} "
    read DELFILE
    if [ $DELFILE == "y" ] || [ $DELFILE == "Y" ];then
      rm "$1/$i"
    fi
  done
}

if [ -z "$1" ]; then
  echo -en "${BLUE}Enter folder path (press enter to use $(pwd))${RESETCOLOR} "
  read FLD_PATH
  if [ FLD_PATH == "" ] || [ -z "$FLD_PATH" ]; then
    FLD_PATH=$(pwd)
  fi
else
  FLD_PATH=$1
fi
clean_folder $FLD_PATH
echo -e "${GREEN}That's it! ${RESETCOLOR}"
