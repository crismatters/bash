#!/bin/bash
FOLDERNAME="files"
array=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
n=$(($RANDOM%5))
length=${#array[*]}
rm -rf $FOLDERNAME
mkdir $FOLDERNAME
cd $FOLDERNAME
for ((i=0; i<10; i++))
do
        ext=" "
        for ((j=0; j<$n; j++))
        do
                index=$(($RANDOM%$length))
                ext=$(echo $ext${array[$index]})
        done
        extensiones+=($ext)
        n=$(($RANDOM%5))
done
echo ${extensiones[*]}
j=0
for i in $(echo ${extensiones[@]})
do
        j=$(($j+1))
        touch file$j.$i
done
echo "Generating random files..."
sleep 2
