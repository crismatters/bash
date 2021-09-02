#!/bin/bash
SCALE=$1
VALUE=2
PI=0
FITNESS=1
DELTA=3
if [ -z $1 ];then
  echo "Please provide a scale."
  read SCALE
fi
while [ $(echo "$DELTA==0" |bc) != "1" ]
do
    PI=$(echo "$PI+$DELTA" | bc)
    DELTA=$(echo "scale=$SCALE;(4/($VALUE*($VALUE+1)*($VALUE+2)))-(4/(($VALUE+2)*($VALUE+3)*($VALUE+4)))" | bc)
    VALUE=$(($VALUE+4))
    FITNESS=$(($FITNESS+1))
    if [ $DELTA == 0 ]; then
      echo -ne "\e[32m$PI\r"
    else
      if [ $(echo "$DELTA<=0.00000005" |bc) != "1"  ]; then
        echo -ne "\e[31m$PI\r"
      else
        echo -ne "\e[33m$PI\r"
      fi;
    fi;
done
echo ""
