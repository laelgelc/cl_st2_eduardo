
for delfile in instances/v000045.txt instances/v000048.txt instances/v000051.txt instances/v000046.txt instances/v000046.txt instances/v000047.txt instances/v000050.txt instances/v000049.txt instances/v000052.txt instances/v000053.txt instances/v000054.txt instances/v000055.txt instances/v000056.txt instances/v000057.txt instances/v000058.txt instances/v000059.txt  
do
  rm -f $delfile
done 

while read filevar filein
do

echo "--- conjunctions $filevar ---"

 grep -H 'postag="KC"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000045.txt
 pcregrep -H -M 'form="e".*\n.*postag="V"|form="e".*\n.*postag="ADV"|form="ou".*\n.*postag="V"|form="ou".*\n.*postag="ADV"|form="e".*\n.*postag="SPEC"|form="ou".*\n.*postag="SPEC"|form="nem".*\n.*postag="V"|form="E".*postag="KC"|form="Ou".*postag="KC"|form="Nem".*postag="KC"|form="porém"|form="contudo"|form="entretanto"|form="senão"|form="pois"|form="portanto"|form=".*por_isso' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000048.txt
 pcregrep -H -M 'postag="N".*\n.*form="e".*postag="KC".*\n.*postag="N"|postag="N".*\n.*form="ou".*postag="KC".*\n.*postag="N"|postag="ADJ".*\n.*form="e".*postag="KC".*\n.*postag="ADJ"|postag="ADJ".*\n.*form="ou".*postag="KC".*\n.*postag="ADJ"|postag="N".*\n.*form="e".*postag="KC".*\n.*postag="ADJ"|postag="N".*\n.*form="ou".*postag="KC".*\n.*postag="ADJ"| postag="ADJ".*\n.*form="e".*postag="KC".*\n.*postag="N"|postag="ADJ".*\n.*form="ou".*postag="KC".*\n.*postag="N"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000051.txt
 pcregrep -H -M '.*base="mas"|base="também"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000046.txt
 pcregrep -H 'base="e" postag="KC"|base="nem" postag="KC"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000046.txt
 pcregrep -H 'form="mas"|form="porém"|form="todavia"|form="entretanto"|form="no_entanto"|form="senão"|form="não_obstante"|form="contudo"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000047.txt
 pcregrep -H 'base="ou" postag="KC"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000050.txt
 pcregrep -H 'base="portanto"|base="pois"|base="então"|base="por_isso"|base="por_conseguinte"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000049.txt

 pcregrep -H 'postag="KS"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000052.txt

 pcregrep -H 'postag="KS"' $filein | sed "s/^/$filevar /" | pcregrep 'form="porque"|form="pois"|form="porquanto"|form="como"|form="que"'  | tr '\t' ' ' | tr -s ' ' >> instances/v000053.txt
 pcregrep -H 'form="embora"|form="muito_embora"|form="conquanto"|form="ainda_que"|form="mesmo_que"|form="posto_que"|form="bem_que"|form="se_bem_que"|form="apesar_de_que"|form="nem_que"|form="a_despeito_de"|form="não_obstante"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000054.txt
 pcregrep -H 'postag="KS"' $filein | sed "s/^/$filevar /" | pcregrep 'form="se"|form="caso"|form="quando"|form="contanto_que"|form="salvo_se"|form="sem_que"|form="dado_que"|form="desde_que"|form="a_menos_que"|form="a_não_ser_que"'  | tr '\t' ' ' | tr -s ' ' >> instances/v000055.txt

 pcregrep -H 'postag="KS"' $filein | sed "s/^/$filevar /" | pcregrep 'form="conforme"|form="como"|form="segundo"|form="consoante"'  | tr '\t' ' ' | tr -s ' ' >> instances/v000056.txt
 pcregrep -H 'form="para_que"|form="a_fim_de_que"|form="para_que"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000057.txt
 pcregrep -H 'form="à_medida_que"|form="ao_passo_que"|form="à_proporção_que"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000058.txt
 pcregrep -H 'form="quando"|form="antes_que"|form="depois_que"|form="até_que"|form="logo_que"|form="sempre_que"|form="assim_que"|form="desde_que"|form="enquanto"|form="todas_as_vezes_que"|form="cada_vez_que"|form="apenas"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000059.txt


done < file_index.txt
