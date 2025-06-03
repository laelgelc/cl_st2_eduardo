
for delfile in instances/v000134.txt  
do
  rm -f $delfile
done 

while read filevar filein
do

echo "--- qu_questions $filevar ---"

 pcregrep -H -M -C3 'form="[A-Z].*".*extra=".*interr' $filein | sed "s/^/$filevar /" | grep 'extra=".*interr'  | tr '\t' ' ' | tr -s ' ' >> instances/v000134.txt

done < file_index.txt
