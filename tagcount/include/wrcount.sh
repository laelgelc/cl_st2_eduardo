rm -f instances/v000189.txt

while read filevar filein
do

echo "--- wrcount $filevar ---"

cat $filein | grep 'word id' | grep -v 'postag="pu"' | grep -v '^$' | cut -d'"' -f4 | tr '_' '\n' | grep -v '^[0-9]' > tempwrc   # word-only file
wrc=$( cat tempwrc | wc -l | tr -d ' ' )
echo "$filevar $wrc" >> instances/v000189.txt

done < file_index.txt


