#!/bin/bash
while read line;
do
	if [[ "$line" != "" ]]; then
        	author=${line#*~}
		delim="~"
		quote=${line%$delim*}
        	echo $author once said, \""$quote"\" >> speech.txt
	fi
done < quotes.txt
