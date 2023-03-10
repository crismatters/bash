#!/bin/bash
print_char(){
  MSG=$2
  len=`echo $MSG |awk '{print length}'`
  c=$1
  echo -n  ${MSG:${c}:1}
  if [ $(($c + 1)) -eq $len ];then
    echo ""
  else
    print_char $(($c + 1)) $MSG
  fi
}

greeting="Hello,World"
print_char 0 $greeting
