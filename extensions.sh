#!/bin/bash
if [ -z $1 ]
then
  echo "Organize $(pwd)? y/n"
  read C
  if [ "$C" == "S" ] || [ "$C" == "s" ]
  then
    ORGPATH=$(pwd)
  else
    echo "Provide the desired path"
    echo -n ">"
    read ORGPATH
  fi
else
  ORGPATH=$(pwd)
fi
cd $ORGPATH
for i in $(ls)
do
        file=$(echo ${i##*.})
        files+=($(echo $file))
done
for i in $(echo ${files[*]})
do
        found=0
        for j in $(echo ${distinct[*]})
        do
                if [ "$i" == "$j" ]
                then
                        found=1
                fi
        done
        if [ $found -eq 0 ]
        then
                distinct+=($i)
        fi
done
for i in $(echo ${distinct[*]})
do
        mkdir $i
        mv *.$i $i/
done
ls -R
