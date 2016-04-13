--load the data from HDFS and define the schema
raw1 = LOAD '/data2/cl03.csv' USING PigStorage(',') AS  (date, type:chararray, parl:int, prov:chararray, riding:chararray, lastname:chararray, firstname:chararray, gender:chararray, occupation:chararray, party:chararray, votes:int, percent:double, elected:int);

-- project to make this faster
raw1p = FOREACH raw1 GENERATE parl, type, elected;

-- filter to get only the needed data
won1 = FILTER raw1p by (elected == 1) AND (type == 'Gen');

-- group by parliamenent
grp1 = GROUP won1 by parl;

-- count the number of members for each parliament
sum1 = FOREACH grp1 GENERATE group as parl, COUNT(won1) AS count;

-- repeat for the second set, which will be subtracted from the first set
raw2 = LOAD '/data2/cl03.csv' USING PigStorage(',') AS  (date, type:chararray, parl:int, prov:chararray, riding:chararray, lastname:chararray, firstname:chararray, gender:chararray, occupation:chararray, party:chararray, votes:int, percent:double, elected:int);
raw2p = FOREACH raw2 GENERATE parl, type, elected;
won2 = FILTER raw2p by (elected == 1) AND (type == 'Gen');
grp2 = GROUP won2 by parl; /* as many groups as there are parliaments */
sum2 = FOREACH grp2 GENERATE group as parl, COUNT(won2) AS count;

-- join the 2 sets by shifting down the second set
jnd = JOIN sum1 by parl LEFT, sum2 by (parl + 1);

-- get the difference in member count between a parliament and the previous one
cmp = FOREACH jnd GENERATE ($0), (sum1::count - sum2::count);

-- fix the first parliament count
fix = FOREACH cmp GENERATE ($0), (($1 IS NULL) ? 0 : $1);
