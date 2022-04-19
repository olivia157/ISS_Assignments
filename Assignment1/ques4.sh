#!/bin/bash

#read -a arr
IFS=', ' read -r -a arr
#echo "${arr[*]}"

size=${#arr[@]}
#size=$temp_size-1
#echo $size	

for (( i=0; i < $size-1 ; i++ ))
do
    for (( j=0 ; j < $size-1 ; j++ ))
    do
        if [ ${arr[$j]} -gt ${arr[$j+1]}  ]
        then
        temp=${arr[$j]}
        arr[$j]=${arr[$j+1]}
        arr[$j+1]=$temp
        fi
    done
done


echo "${arr[*]}"
	

		
		
