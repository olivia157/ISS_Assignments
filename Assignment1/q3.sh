#!/bin/bash

#a
filesize=$(stat -c%s "words.txt")
echo "Size of file in bytes = " $filesize

echo
#b
count=0
while read line;
do
	count=$((count+1))
done < words.txt
echo "Number of lines in file = " $count

echo
#c
words=$(wc -w < words.txt)
echo "Number of words in file = " $words

echo
#d
line_count=0
while read line;
do
	line_count=$((line_count+1))
	words_arr=( $line )
	words=${#words_arr[@]}
	echo "line $line_count : $words"
done < words.txt

#e
echo

#cat words.txt | tr '[:punct:]' ' ' | tr -s ' ' | tr ' ' '\n' | sort | uniq -c | awk '{print $2" : "$1}' 
dict=()
while IFS=$'\n' read -r line
do
    IFS=' ' read -ra arr <<< "$line"

    for val in "${arr[@]}"
	do
		flag=1
        for item in "${dict[@]}"
		do
    		if [[ $val == "$item" ]]
			then
				flag=0
				break
			fi
		done
        if [[ $flag -eq 1 ]]
        then
            dict+=($val)
        fi

    done
done < words.txt
input=words.txt
for word in "${dict[@]}"
do
        freq=$( tr '[:space:]' '[\n*]' < $input | grep -c $word )
        if [ $freq -gt 1 ]
        then
                echo "$word : $freq"
        fi
done