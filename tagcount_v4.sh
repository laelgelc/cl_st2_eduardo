###########################
#
# tagging with PALAVRAS must be xml-style
#
# cat text.txt | /opt/palavras/por.pl --sem | perl cg2xml.pl
#
# see cbvr.sh
#
###########################
############################
#
# December 2013:
# 1. TTR fixed (was tokens/types, now it's types/tokens)
# 2. consider adding quando / porque to que-clause types
#    and change them to QU clauses
# 3. consider adding 'ter a' to ter que / de (ter a ver)
# 4. remove adjpre (pre-modifying) as it is  the same as adjattr (attributive adj); was in F3, then removed
#
############################
# April 2014:
# 1. TTR fixed (was 1/(tokens/types), now it's types/tokens)
#
############################
# February 2023:
# corpus


#tr ' ' '\n' < misc/old_counter.sh | grep 'fileout' | grep outputdir | cut -d'.' -f2- | grep '[a-z]' | sed 's/.instances//' | cut -f1 | sort | uniq | sed 's/\(.*\)\([\.]\)\(.*\)$/\3 \1\2\3 /' | nl -nrz | sed 's/^/v/' | tr '\t' ' ' | sed 's/ $//' > var_index.txt
# columns: vcode code fullcode = v000190 wl vd.word_length.wl 


#taggedcorpusdir=/Users/tony/Documents/orientacao/aline_z/tagged
#taggedcorpusdir=/Users/carloskauffmann/lab/aline_z/newcorpus/corpus_utf8_tagged
#taggedcorpusdir=/Users/alinemilanez/Dropbox/Mac/Desktop/Artigo_posses/tentativa_1_Carlos
#taggedcorpusdir=/Users/tony/Temp/aline/2023-02/corpus_utf8_tagged
#taggedcorpusdir=/Users/tony/Dropbox/Orientacao/aline_z/2023-03/corpus_utf8_tagged
#taggedcorpusdir=/Users/carloskauffmann/lab/Aline_Z/tagged
#taggedcorpusdir=/Users/tony/Dropbox/Orientacao/aline_z/aline_z/tagged
taggedcorpusdir=/Users/carloskauffmann/lab/edu_divulg_cientifica/tagged
#/Users/carloskauffmann/lab/chk_climaplus/tagged


find $taggedcorpusdir  -type f | tr -s '/' | grep -v 'DS_Store' | nl -nrz | sed 's/^/t/' | tr '\t' ' '  > file_index.txt

mkdir -p instances

debug () {

    echo "--- DEBUGGING ONLY ---"
    sh tagcount/include/debug.sh

}

features () {

echo "--- adjectives ---"
sh tagcount/include/adjectives.sh

echo "--- adverbs ---"
sh tagcount/include/adverbs.sh

echo "--- articles ---"
sh tagcount/include/articles.sh

echo "--- clauses ---"
sh tagcount/include/clauses.sh

echo "--- conjunctions ---"
sh tagcount/include/conjunctions.sh

echo "--- modals ---"
sh tagcount/include/modals.sh

echo "--- nouns ---"
sh tagcount/include/nouns.sh

echo "--- prepositions ---"
sh tagcount/include/prepositions.sh

echo "--- pronouns ---"
sh tagcount/include/pronouns.sh

echo "--- qu questions ---"
sh tagcount/include/qu_questions.sh

echo "--- question tags ---"
sh tagcount/include/question_tags.sh

echo "--- stance ---"
sh tagcount/include/stance.sh

echo "--- TTR ---"
sh tagcount/include/ttr.sh

echo "--- verbs ---"
sh tagcount/include/verbs.sh

echo "--- word count ---"
sh tagcount/include/wrcount.sh

echo "--- word length ---"  # must follow word count
sh tagcount/include/wl.sh

echo "--- yes-no questions ---"
sh tagcount/include/yesno_questions.sh

}

counts () {

mkdir -p tagcount/sas
rm -f s

while read filevar filein
do
  echo "--- counts $filevar ---"
  rg -c $filevar instances/* | tr '/.:' ' ' | cut -d' ' -f2,4 | sed "s/^/$filevar /" >> s
done < file_index.txt

grep -v -E 'v000188|v000189|v000190' s > tagcount/sas/data.txt

for var in v000188 v000189 v000190
do
  sed "s/ / $var /" instances/$var.txt >> tagcount/sas/data.txt
done

# add variables that didn't occur in the corpus to the sas dataset
# so the dataset will work for the additive analysis, since some of these variables 
# may have loaded in the factors from the BR-PT dim analysis 
cut -d' ' -f2 tagcount/sas/data.txt | sort | uniq > v
cut -d' ' -f1 var_index.txt > i
cat v i | sort | uniq -c | sed 's/[ ]*//' | grep '^1 ' | cut -d' ' -f2 | sed 's/\(.*\)/t000001 \1 0/' >> tagcount/sas/data.txt


}

sasformats () {

echo "PROC FORMAT library=work ;
  VALUE  \$featurelabels" > tagcount/sas/feature_labels_format.sas
  tr '.' ' ' < var_index.txt | sed 's/\(.*\) \(.*\) \(.*\) \(.*\) \(.*\)/"\1" = "\3: \4"/' | tr '_' ' ' | sed 's/vd:/other:/' >> tagcount/sas/feature_labels_format.sas
echo ";
run;
quit;" >> tagcount/sas/feature_labels_format.sas

echo "PROC FORMAT library=work ;
  VALUE  \$featurelabelsfull" > tagcount/sas/feature_labels_full_format.sas
  tr '.' ' ' < var_index.txt | sed 's/\(.*\) \(.*\) \(.*\) \(.*\) \(.*\)/"\1" = "\3: \4 (\2)"/' | tr '_' ' ' | sed 's/vd:/other:/' >> tagcount/sas/feature_labels_full_format.sas
echo ";
run;
quit;" >> tagcount/sas/feature_labels_full_format.sas

}

metadata () {

sed "s;$taggedcorpusdir/;;" file_index.txt | cut -d'_' -f1,2 | tr '_' ' ' | sort -t' ' -k2,2 > m

# hand-edited m and saved it as sas/metadata.txt

}

#debug

#features
#counts
#sasformats
metadata


