﻿SET SEARCH_PATH TO "cs421g04";

-- Get all premium users who have damaged their car but have an insurance policy
SELECT
  "Users"."uID",
  "Users".name,
  "Users".email
FROM "Users"
  INNER JOIN "Reservations" ON "Users"."uID" = "Reservations"."uID"
  INNER JOIN "Damage" ON "Damage"."vID" = "Reservations"."vID"
WHERE "Users"."isPremium" = TRUE AND
      "Reservations"."typeOfCoverage" <> 'N/A';

-- Get the rID and license number of all reservations that have a specific bID (3) as dropoff or pickup branch
SELECT
  "Reservations"."rID",
  "Reservations"."licenseNumber"
FROM "Reservations"
  INNER JOIN "Vehicles" ON "Reservations"."vID" = "Vehicles"."vID"
WHERE "Vehicles"."bID" = 3
UNION
SELECT
  "Reservations"."rID",
  "Reservations"."licenseNumber"
FROM "Dropoff"
  INNER JOIN "Reservations" ON "Dropoff"."rID" = "Reservations"."rID"
WHERE "Dropoff"."bID" = 3;

-- Get branch ID and vehicle ID (that have manual transmission) that has been reported to be in an accident)
SELECT 
  "bID", 
  "Damage"."vID"
FROM 
  "cs421g04"."Damage" INNER JOIN "cs421g04"."Vehicles" ON ("cs421g04"."Damage"."vID" = "cs421g04"."Vehicles"."vID") 
WHERE transmission = 'Manual';

-- Get the amount of cars at every branch
SELECT "Branches".address,COUNT("Vehicles"."bID") AS NumberOfVehicles FROM cs421g04."Vehicles"
LEFT  JOIN cs421g04."Branches"
ON "Branches"."bID"="Vehicles"."bID"
GROUP BY address;

-- Get all the users that reserved a particular vehicle ordered by the vID
SELECT "Reservations"."vID","Users"."name"
FROM "cs421g04"."Reservations"
  INNER JOIN "cs421g04"."Users" ON "Users"."uID" = "Reservations"."uID"
WHERE "Reservations"."uID" in (SELECT "Reservations"."uID"
			FROM "cs421g04"."Reservations"
			WHERE "Reservations"."vID" > 0)
ORDER BY "Reservations"."vID";
