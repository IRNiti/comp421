raw = LOAD '/data2/cl03.csv' USING PigStorage(',') AS  (date, type:chararray, parl:int, prov:chararray, riding:chararray, lastname:chararray, firstname:chararray, gender:chararray, occupation:chararray, party:chararray, votes:int, percent:double, elected:int);
fltrd = FILTER raw by votes > 99 ;
won = filter fltrd by elected == 1;
lost = filter fltrd by elected == 0;
both =join won by (date,riding,prov), lost by (date,riding,prov);
close = filter both by (won::votes)-(lost::votes) < 10;
less = foreach close generate(won::lastname,lost::lastname,won::votes -lost::votes);
STORE less INTO 'q2';