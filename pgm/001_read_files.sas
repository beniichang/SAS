/* read in an excel (xlsx) file */
proc import datafile='/home/u1264517/general/auto.xlsx'
	out=auto
	dbms=xlsx
	replace;
	getnames=yes;
run;

/* save the temporary file as a permanent file  */
libname out '/home/u1264517/out';
data out.auto; set auto; run;


/* output data into an excel file */
proc export 
	data=auto 
	outfile='/home/u1264517/general/auto_2.xlsx' 
	dbms = xlsx 
	replace;
run;


/* check data */
proc contents data=out.auto; run;
/* show variables in order */
proc contents data=out.auto varnum; run;


* check all data in one folder;
proc datasets lib=out;
	contents;
run;


