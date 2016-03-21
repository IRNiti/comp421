INSERT INTO "Promotions" (pid, info) VALUES (1, '<promotion>
	<title>Explore Germany</title>
	<description>Save on your Enterprise car rental in Germany.</description>
	<startdate>2016-03-10</startdate>
	<enddate>2016-4-20</enddate>
	<percentoff>10</percentoff>
</promotion>');

INSERT INTO "Promotions" (pid, info) VALUES (2, '<promotion>
	<title>Weekend Special</title>
	<description>Enjoy weekend rates starting from $9.99 per day when you rent from Friday through Monday.</description>
	<startdate>2016-03-15</startdate>
	<enddate>2016-5-23</enddate>
	<discountperday>9.99</discountperday>
</promotion>');

INSERT INTO "Promotions" (pid, info) VALUES (3, '<promotion>
	<title>Truck Winter Special</title>
	<description>Local move? DIY project? Weekend errands? Save big on your next personal truck or van rental</description>
	<startdate>2016-03-16</startdate>
	<enddate>2016-6-18</enddate>
	<percentoff>33</percentoff>
</promotion>');

INSERT INTO "Promotions" (pid, info) VALUES (4, '<promotion>
	<title>Explore the UK</title>
	<description>Save on your Enterprise car rental in the UK.</description>
	<startdate>2016-03-10</startdate>
	<enddate>2016-4-20</enddate>
	<percentoff>10</percentoff>
</promotion>');

INSERT INTO "Promotions" (pid, info) VALUES (5, '<promotion>
	<title>Explore Spain</title>
	<description>Save on your Enterprise car rental in Spain.</description>
	<startdate>2016-03-10</startdate>
	<enddate>2016-4-20</enddate>
	<percentoff>10</percentoff>
</promotion>');

INSERT INTO "Promotions" (pid, info) VALUES (6, '<promotion>
	<title>Explore Ireland</title>
	<description>Save on your Enterprise car rental in Ireland.</description>
	<startdate>2016-03-10</startdate>
	<enddate>2016-4-20</enddate>
	<percentoff>10</percentoff>
</promotion>');

UPDATE "cs421g04"."Reservations"
SET "promotion" = 1
WHERE "rID" = 9;

UPDATE "cs421g04"."Reservations"
SET "promotion" = 1
WHERE "rID" = 11;

UPDATE "cs421g04"."Reservations"
SET "promotion" = 2
WHERE "rID" = 20;

UPDATE "cs421g04"."Reservations"
SET "promotion" = 3
WHERE "rID" = 16;

UPDATE "cs421g04"."Reservations"
SET "promotion" = 4
WHERE "rID" = 19;

UPDATE "cs421g04"."Reservations"
SET "promotion" = 4
WHERE "rID" = 27;

UPDATE "cs421g04"."Reservations"
SET "promotion" = 5
WHERE "rID" = 3;

UPDATE "cs421g04"."Reservations"
SET "promotion" = 6
WHERE "rID" = 1;
