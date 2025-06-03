
for delfile in instances/v000136.txt  
do
  rm -f $delfile
done 

while read filevar filein
do

echo "--- question_tags $filevar ---"

 pcregrep -H -M 'form=",.*\n.*postag="V".*\n.*form="\?|form="né"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000136.txt

done < file_index.txt
