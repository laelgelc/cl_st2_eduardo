rm -f instances/v000188.txt

while read filevar filein
do

echo "--- TTR $filevar ---"

cat $filein | tr ' ' '\n' | grep -v '^$' | head -400 > tempttr
tokensttr=$(cat tempttr | wc -l )  #text may be shorter than 400
typesttr=$(sort tempttr | uniq | wc -l )
ttr=$(echo "scale=3; $typesttr / $tokensttr" | bc )
echo "$ttr" | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000188.txt

done < file_index.txt

