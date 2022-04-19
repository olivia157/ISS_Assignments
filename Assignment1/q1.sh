awk 'NF' quotes.txt 
echo
echo
echo
awk  '!a[$0]++' quotes.txt