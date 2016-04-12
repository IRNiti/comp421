--load the data from HDFS and define the schema
raw = LOAD '/data2/cl03.csv' USING PigStorage(',') AS  (date, type:chararray, parl:int, prov:chararray, riding:chararray, lastname:chararray, firstname:chararray, gender:chararray, occupation:chararray, party:chararray, votes:int, percent:double, elected:int);

--filter
fltrd = FILTER raw by percent >= 60.0;

--project only the needed fields
gen = foreach fltrd generate CONCAT(firstname, CONCAT(' ', lastname));

--show only distinct entries
results = DISTINCT gen;

--store results into q1
STORE results INTO 'q1';

ILLUSTRATE results;
