/* read in an excel (xlsx) file */
proc import datafile='/home/u1264517/general/auto.xlsx'
	out=auto
	dbms=xlsx
	replace;
	getnames=yes;
run;


/*	csv, comma separated files. The following is one example
	Acura,MDX,SUV,Asia,All,"$36,945 ","$33,337 ",3.5,6,265,17,23,4451,106,189
*/

* 1. import as dbms csv, getnames = no;
proc import datafile="/home/u1264517/general/cars.csv" 
	out=cars
	dbms=csv 
	replace;
    getnames=no; *note this getnames = no statement;
run;

* 2. import as csv, getnames = yes;
proc import datafile="/home/u1264517/general/cars.csv" 
	out=cars
	dbms=csv
	replace;
    getnames=yes; 
run;

* 3. import as csv, getnames = yes, no replace, import will be cancelled;
proc import datafile="/home/u1264517/general/cars.csv" 
	out=cars
	dbms=csv;
    getnames=yes; 
run;

* 4. import as dlm;
proc import datafile="/home/u1264517/general/cars.csv" 
	out=cars
	dbms=dlm 
	replace;
	delimiter=",";
    getnames=yes; 
run;