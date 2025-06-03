
for delfile in instances/v000133.txt  
do
  rm -f $delfile
done 

while read filevar filein
do

echo "--- prepositions $filevar ---"

 grep -H 'postag="PRP"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000133.txt

done < file_index.txt
