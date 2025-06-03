
for delfile in instances/v000121.txt instances/v000124.txt instances/v000124.txt	#including instances/v000124.txt instances/v000127.txt instances/v000120.txt instances/v000119.txt instances/v000119.txt instances/v000123.txt instances/v000122.txt instances/v000126.txt instances/v000125.txt instances/v000132.txt instances/v000131.txt instances/v000130.txt instances/v000118.txt instances/v000128.txt instances/v000117.txt instances/v000116.txt instances/v000129.txt  
do
  rm -f $delfile
done 

while read filevar filein
do

echo "--- pronouns $filevar ---"

 grep -H 'morf=".*1S.*"' $filein | sed "s/^/$filevar /" | grep 'postag="PERS"' | pcregrep 'ACC"|PIV"' | grep -v 'extra=".*poss.*"'  | tr '\t' ' ' | tr -s ' ' >> instances/v000121.txt #comigo is tagged as 'com' on one line and 'mim' on another; these cases are picked up here
 grep -H 'morf=".*2S.*"' $filein | sed "s/^/$filevar /" | grep 'postag="PERS"' | pcregrep 'ACC"|PIV"' | grep -v 'extra=".*poss.*"'  | tr '\t' ' ' | tr -s ' ' >> instances/v000124.txt
 grep -H 'base="você"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000124.txt	#including 'você'
 pcregrep -H -M 'form="a".*\n.*form="gente"' $filein | sed "s/^/$filevar /" | grep -v 'form="a"' | grep -v 'deprel="SUBJ'  | tr '\t' ' ' | tr -s ' ' >> instances/v000124.txt #a gente
 grep -H 'morf=".*3S.*"' $filein | sed "s/^/$filevar /" | grep 'postag="PERS"' | pcregrep 'ACC"|PIV"' | grep -v 'extra=".*poss.*"' | grep -v 'base="você"'  | tr '\t' ' ' | tr -s ' ' >> instances/v000127.txt #excluding 'você'

 pcregrep -H -M 'form="eu".*deprel="SUBJ>"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000120.txt
 pcregrep -H -M 'form="nós".*deprel="SUBJ>"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000119.txt
 pcregrep -H -M 'form="a".*\n.*form="gente".*deprel="SUBJ' $filein | sed "s/^/$filevar /" | grep -v 'form="a"'  | tr '\t' ' ' | tr -s ' ' >> instances/v000119.txt #a gente
 pcregrep -H -M 'form="tu".*deprel="SUBJ>"|form="você".*deprel="SUBJ>"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000123.txt
 pcregrep -H -M 'form="vós".*deprel="SUBJ>"|form="vocês".*deprel="SUBJ>"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000122.txt
 pcregrep -H -M 'form="ele".*deprel="SUBJ>"|form="ela".*deprel="SUBJ>"|form="senhor".*deprel="SUBJ>"|form="senhora".*deprel="SUBJ>"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000126.txt
 pcregrep -H -M 'form="eles".*deprel="SUBJ>"|form="elas".*deprel="SUBJ>"|form="senhores".*deprel="SUBJ>"|form="senhoras".*deprel="SUBJ>"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000125.txt

 pcregrep -H -M 'base="que".*postag="SPEC"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000132.txt
 pcregrep -H -M 'base="cujo"|base="o_qual"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000131.txt

 pcregrep -H -M 'postag="PRP".*\n.*base="o_qual".*SPEC|postag="PRP".*\n.*base="que".*SPEC' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000130.txt

 grep -H 'extra=".*dem.*"' $filein | sed "s/^/$filevar /" | grep -v 'extra=".*art.*"'  | tr '\t' ' ' | tr -s ' ' >> instances/v000118.txt
 grep -H 'extra=".*quant.*"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000128.txt
 grep -H 'extra=".*poss.*"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000117.txt
 pcregrep -H -M 'base="algum".*\n.*postag="V"|base="algo".*\n.*postag="V"|base="nenhum".*\n.*postag="V"|base="nada".*\n.*postag="V"|base="todo".*\n.*postag="V"|base="tudo".*\n.*postag="V"|base="ninguém".*\n.*postag="V"|base="outrem".*\n.*postag="V"|base="todo_mundo".*\n.*postag="V"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000116.txt
 pcregrep -H -M 'form="lo".*postag="PRN"|form="la".*postag="PRN"|form="los".*postag="PRN"|form="las".*postag="PRN"|form="na".*postag="PRN"|form="nas".*postag="PRN"|form="no".*postag="PRN"|form="la"|form="nos".*postag="PRN"|form="lhe"|form="lhes"|form="conosco"|form="vos".*postag="PERS"|form="convosco"|form="si"|form="consigo".*postag="PERS"' $filein | sed "s/^/$filevar /"  | tr '\t' ' ' | tr -s ' ' >> instances/v000129.txt

done < file_index.txt
