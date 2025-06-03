
for delfile in instances/v000085.txt instances/v000091.txt instances/v000087.txt instances/v000093.txt instances/v000093.txt instances/v000088.txt instances/v000088.txt instances/v000092.txt instances/v000090.txt instances/v000086.txt instances/v000089.txt
do
  rm -f $delfile
done 

while read filevar filein
do

echo "--- modals $filevar ---"

 pcregrep -H -M 'base="poder" postag="V".*\n.*postag="V"|base="poder" postag="V".*\n.*postag="V"|base="dever" postag="V".*\n.*postag="V"|base="ter" postag="V".*\n.*base="que" postag="KS"|base="ter" postag="V".*\n.*base="de" postag="PRP"|base="haver" postag="V".*\n.*base="que" postag="KS"|base="haver" postag="V".*\n.*base="de" postag="PRP"|base="precisar" postag="V".*\n.*postag="V"|base="parecer" postag="V".*\n.*base="que" postag="KS"|base="conseguir" postag="V".*\n.*postag="V"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000085.txt
 pcregrep -H -M 'base="poder" postag="V".*\n.*postag="V"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000091.txt
 pcregrep -H -M 'base="dever" postag="V".*\n.*postag="V"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000087.txt
 pcregrep -H -M 'base="ter" postag="V".*\n.*base="que" postag="KS"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000093.txt
 pcregrep -H -M 'base="ter" postag="V".*\n.*base="de" postag="PRP"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000093.txt
 pcregrep -H -M 'base="haver" postag="V".*\n.*base="que" postag="KS"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000088.txt
 pcregrep -H -M 'base="haver" postag="V".*\n.*base="de" postag="PRP"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000088.txt
 pcregrep -H -M 'base="precisar" postag="V".*\n.*postag="V"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000092.txt
 pcregrep -H -M 'base="parecer" postag="V".*\n.*base="que" postag="KS"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000090.txt
 pcregrep -H -M 'base="conseguir" postag="V".*\n.*postag="V"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000086.txt


#mdoblig md.modal_obligation.mdoblig
 pcregrep -H -M 'base="dever" postag="V".*\n.*postag="V"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000089.txt
 pcregrep -H -M 'base="ter" postag="V".*\n.*base="que" postag="KS"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000089.txt
 pcregrep -H -M 'base="ter" postag="V".*\n.*base="de" postag="PRP"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000089.txt
 pcregrep -H -M 'base="haver" postag="V".*\n.*base="que" postag="KS"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000089.txt
 pcregrep -H -M 'base="haver" postag="V".*\n.*base="de" postag="PRP"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000089.txt
 pcregrep -H -M 'base="precisar" postag="V".*\n.*postag="V"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000089.txt





done < file_index.txt
