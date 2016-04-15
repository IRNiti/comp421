raw = LOAD '/data2/emp.csv' USING PigStorage(',') AS (empid:int, fname:chararray, lname:chararray, deptname:chararray, isManager:chararray, mgrid:int, salary:int);

mgr = FILTER raw by isManager == 'Y' and deptname == 'Finance';

emp_cut = FOREACH raw GENERATE empid, mgrid;

mgr_cut = FOREACH mgr GENERATE empid, lname;

both = JOIN emp_cut by mgrid, mgr_cut by empid;

mana_rel = GROUP both by mgr_cut::empid;

results = FOREACH mana_rel GENERATE $0, FLATTEN(both.$3), COUNT($1);

final_result = DISTINCT results;

DUMP final_result;

STORE final_result INTO 'q5';

EXPLAIN -out Q5_explain.txt final_result;
