raw = LOAD '/data2/cl03.csv' USING PigStorage(',') AS  (date, type:chararray, parl:int, prov:chararray, riding:chararray, lastname:chararray, firstname:chararray, gender:chararray, occupation:chararray, party:chararray, votes:int, percent:double, elected:int);
winners = FILTER raw by elected == 1;
grouped = GROUP winners BY (parl, party);
-- sketchy shit starting here
result = FOREACH grouped {
        parties_subset = FILTER winners BY party == party;
        parties_subset_count = COUNT(parties_subset);
        parliaments_subset = FILTER winners BY parl == parl;
        parliaments_subset_count = COUNT(parliaments_subset);
        GENERATE group.parl, group.party, parties_subset_count, parliaments_subset_count;
}
--describe grouped;
Dump result;
--STORE result INTO 'hdfs://cs421-hd1.cs.mcgill.ca:9000/user/cs421g04/q4' USING PigStorage(',');

