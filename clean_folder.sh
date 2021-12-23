#!/bin/bash
clean_folder (){
  cd $1
  for i in *.*; do
    echo -n "Open $i? (y/N)"
    read OPTION;
  done
}

if [ -z "$1" ]; then
  echo -n "Enter folder path (press enter to use $(pwd)): "
  read FLD_PATH
  if [ FLD_PATH == "" ] || [ -z "$FLD_PATH" ]; then
    FLD_PATH=$(pwd)
  fi

  echo "Starting to list files from $FLD_PATH..."
else
  FLD_PATH=$1
fi
clean_folder $FLD_PATH
