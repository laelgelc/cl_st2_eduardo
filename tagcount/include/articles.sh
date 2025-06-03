
for delfile in instances/v000043.txt instances/v000044.txt  
do
  rm -f $delfile
done 

while read filevar filein
do

echo "--- articles $filevar ---"

 grep -H 'extra=".*artd.*"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000043.txt
 grep -H 'extra=".*arti.*"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000044.txt
done < file_index.txt
