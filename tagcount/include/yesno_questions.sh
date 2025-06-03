
for delfile in instances/v000135.txt  
do
  rm -f $delfile
done 

while read filevar filein
do

echo "--- yesno_questions $filevar ---"

 tr -d '\' < $filein | sed "s/^/$filevar /" | sed 's;</sentence;\</sentence;' | sed -e 's/base="[a-zA-ZáéíóúâêôÁÉÍÓÚÂÊÔçÇãÃ0-9_\#<>(),\?\.\;\: \-]*"//' -e 's/postag="[a-zA-ZáéíóúâêôÁÉÍÓÚÂÊÔçÇãÃ0-9_\-]*"//' -e 's/morf="[a-zA-ZáéíóúâêôÁÉÍÓÚÂÊÔçÇãÃ0-9\/_ \-]*"//' -e 's/head="[a-zA-ZáéíóúâêôÁÉÍÓÚÂÊÔçÇãÃ0-9_ ]-*"//' -e 's/deprel="[a-zA-ZáéíóúâêôÁÉÍÓÚÂÊÔçÇãÃ0-9<>_ \-]*"//' -e 's;/>;;' | tr -d '\n' | tr '\' '\n' | pcregrep --buffer-size=1000K 'form="\?' | pcregrep -v --buffer-size=1000K '.*interr' | tr '\t\' '\n' | pcregrep -B1 '</sentence' | pcregrep -v -e '</sentence' -e '^\-' | sed 's/^/:	/'  | tr '\t' ' ' | tr -s ' ' >> instances/v000135.txt

done < file_index.txt
