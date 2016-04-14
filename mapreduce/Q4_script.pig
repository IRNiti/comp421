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
AD '/data2/cl03.csv' USING PigStorage(',') AS  (date, type:chararray, parl:int, prov:chararray, riding:chararray, lastname:chararray, firstname:chararray, gender:chararray, occupation:chararray, party:chararray, votes:int, percent:double, elected:int);

-- Get all winners
winners = FILTER raw by elected == 1;

-- Group all winners by parliament
parliaments = GROUP winners BY parl;

-- Get the # of winners per parliament
parliament_members = FOREACH parliaments GENERATE group as parl, COUNT(winners) AS count, FLATTEN(winners);

-- Get all winners by party
parties = GROUP winners BY party;

-- Get the # of winners per party
parties_members = FOREACH parties GENERATE group as party, COUNT(winners) AS count2;

--describe parliament_members;
--describe parties_members;

-- Join both tables on the common party
joined = JOIN parliament_members by winners::party, parties_members by party;

-- Go through each entry and select necessary fields for output
total = FOREACH joined GENERATE parliament_members::parl, parties_members::party, parties_members::count2, parliament_members::count;

-- Remove duplicates
unique_total = DISTINCT total;

--Dump unique_total;

-- Write to storage
STORE unique_total INTO 'q4' USING PigStorage(',');

