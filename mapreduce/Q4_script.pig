raw = LOAD '/data2/cl03.csv' USING PigStorage(',') AS  (date, type:chararray, parl:int, prov:chararray, riding:chararray, lastname:chararray, firstname:chararray, gender:chararray, occupation:chararray, party:chararray, votes:int, percent:double, elected:int);

-- Get all winners
winners = FILTER raw by elected == 1;

-- Get rid of useless columns, but keep one extra
X = FOREACH winners GENERATE party, parl, date;

-- Get the party size for a given party and parliament
A = GROUP X by (parl, party);
B = FOREACH A GENERATE $0, COUNT(X) as partySize;
C = FOREACH B GENERATE FLATTEN($0), partySize;

-- C = parl, party, partySize

-- Get the parliament size for a given parliament
D = GROUP X BY parl;
E = FOREACH D GENERATE $0, COUNT(X) as parlSize;
F = FOREACH E GENERATE FLATTEN($0), parlSize;

-- F = parl, parlSize

-- Join
J = JOIN G by (party, parl), C by (group::party, group::parl);
K = JOIN J by G::parl, F by group;

-- Format
P = FOREACH K GENERATE J::G::parl, J::C::group::party, J::C::partySize, F::parlSize;

Q = DISTINCT P;

-- Write to storage
STORE unique_total INTO 'q4' USING PigStorage(',');
