#!/bin/bash


#a
IFS='' read -r -a word
len=${#word}

for (( i=$len-1 ; i>=0 ; i-- ))
do
	revword=$revword${word:$i:1}
done
echo $revword

#b
new=$(echo "$revword" | tr "0-9a-zA-Z" "1-9a-zA-Z_")
echo $new

#c
for (( i=$len/2-1 ; i>=0 ; i-- ))
do
	halfword=$halfword${word:$i:1}
done
for (( i=$len/2 ; i<$len ; i++ ))
do
	halfword=$halfword${word:$i:1}
done
echo $halfword
