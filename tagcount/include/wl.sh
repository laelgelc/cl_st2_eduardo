rm -f instances/v000190.txt

while read filevar filein
do

echo "--- wrcount $filevar ---"

characs=$( cut -d'"' -f4 $filein | grep '[a-záéíóúâêôçãõüàA-ZÁÉÍÓÚÂÊÔÇÃÕÜÀ]' | wc -c | tr -dc '[0-9]' )
wrc=$( grep $filevar instances/v000189.txt | cut -d' ' -f2 )
wl=$(echo "scale=3; $characs / $wrc" | bc )
echo "$filevar $wl"  | tr '\t' ' ' | tr -s ' ' >> instances/v000190.txt

done < file_index.txt


