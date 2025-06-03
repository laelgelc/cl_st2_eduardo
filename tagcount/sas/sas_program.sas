/* ENTER YOUR SAS ONDEMAND FOLDER NAME BELOW */

%let myfolder=lexbr ;

DATA long1;
  INFILE "~/&myfolder/data.txt" ;
  length file $ 8 feature $ 8 count 8 ;
  input file $ feature $ count ;
RUN;

proc sort data= long1; by file; run;
    
proc transpose data=long1 out=observed ;
    by file ;
    id feature ;
    var count;
run;

data observed (DROP= _NAME_) ; set observed; run;

/* turn missing to zeros  */

proc stdize data = observed out=observed reponly missing=0; run;

PROC EXPORT
  DATA= work.observed
  DBMS=TAB
  OUTFILE="~/&myfolder/observed.tsv"
  REPLACE;
RUN;

/* norming */

data temp (DROP= file v000189);
set observed ;
if _n_ <=1 ;
run;

proc transpose data=temp out= rot ; run;

proc sql ;
    select _name_ into :names separated by ' ' from rot ;
quit;

data normed ;
    set observed ;
    array v &names ;
    do over v ; 
      v = ( v / v000189 ) * 1000;       
    end ;
run;

PROC EXPORT
  DATA= work.normed
  DBMS=TAB
  OUTFILE="~/&myfolder/normed.tsv"
  REPLACE;
RUN;

proc datasets library=work nolist;
delete 
temp long1 rot  ;
run;


