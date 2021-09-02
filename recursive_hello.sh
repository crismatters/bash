#!/bin/bash
print_char(){
  MSG=("H" "E" "L" "L" "O" "_" "W" "O" "R" "L" "D")
  c=$1
  echo -n  ${MSG[$c]}
  if [ $(($c + 1)) -eq ${#MSG[@]} ];then
    echo ""
  else
    print_char $(($c + 1)) ${MSG[@]}
  fi
}
print_char 0
