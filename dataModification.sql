-- updating with the result of a query and also updating multiple tuples at once
-- if vehicle has been returned, change vehicle location to dropoff location

UPDATE "cs421g04"."Vehicles" 
SET "bID" = subquery."bID" 
FROM(
	SELECT "Dropoff"."bID", "Reservations"."vID"
	FROM "cs421g04"."Dropoff" INNER JOIN "cs421g04"."Reservations" ON "Reservations"."rID" = "Dropoff"."rID"
	WHERE "Dropoff"."rID" in
		(SELECT "Reservations"."rID"
		FROM "cs421g04"."Reservations"
		WHERE "Reservations"."isReturned" = true)
		) AS subquery
WHERE "Vehicles"."vID" = subquery."vID";


-- insert result of a query
-- insert bill based on reservation (adds up cost of vehicle, insurance and extra if any) and sets date of bill as reservation pickup date

INSERT INTO "cs421g04"."Bill" ("amount", "date", "paymentMethod", "isPaid", "rID") VALUES (

	(SELECT "Vehicles"."costPerDay" + "InsurancePolicy"."price" + COALESCE("Extras"."costPerDay", 0)
	FROM ((("cs421g04"."Reservations" INNER JOIN "cs421g04"."Vehicles" ON "Reservations"."vID" = "Vehicles"."vID") 
		INNER JOIN "cs421g04"."InsurancePolicy" ON "Reservations"."typeOfCoverage" = "InsurancePolicy"."typeOfCoverage")
		LEFT OUTER JOIN "cs421g04"."Upgrades" ON "Vehicles"."vID" = "Upgrades"."vID")
		LEFT OUTER JOIN "cs421g04"."Extras" ON "Upgrades"."eID" = "Extras"."eID"
	WHERE "Reservations"."rID" = 6),

	(SELECT "Reservations"."pickUpDate"
	FROM "cs421g04"."Reservations"
	WHERE "Reservations"."rID" = 6)
	
, 'Cash', '0', 6);


-- updating several tuples at once
-- if a branch were to close down, move vehicles from that branch to another

UPDATE "cs421g04"."Vehicles" 
SET "bID" = 3
WHERE "bID" = 2; 


-- deleting a set of tuples that is more than one but less than all the tuples in a relation
-- delete reviews that have a rating of less than 5

DELETE FROM "cs421g04"."Review"
WHERE "Review"."rating" < 5;