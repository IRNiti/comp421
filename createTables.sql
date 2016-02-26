CREATE SCHEMA "CarRental";

CREATE TABLE "CarRental"."Users"
(
   "uID" integer NOT NULL, 
   name character varying NOT NULL, 
   address character varying NOT NULL, 
   email character varying NOT NULL, 
   "isPremium" boolean NOT NULL, 
   points integer,  
   CONSTRAINT "uID" PRIMARY KEY ("uID")
) 
WITH (
  OIDS = FALSE
)
;

CREATE TABLE "CarRental"."InsurancePolicy"
(
   "typeOfCoverage" character varying NOT NULL, 
   price double precision NOT NULL, 
   description text, 
   PRIMARY KEY ("typeOfCoverage")
) 
WITH (
  OIDS = FALSE
)
;
CREATE TABLE "CarRental"."Extras"
(
  "eID" integer NOT NULL,
  name character varying NOT NULL,
  description text,
  "costPerDay" double precision,
  CONSTRAINT "Extras_pkey" PRIMARY KEY ("eID")
)
WITH (
  OIDS=FALSE
);
CREATE TABLE "CarRental"."Branches"
(
   "bID" integer NOT NULL, 
   address character varying NOT NULL, 
   PRIMARY KEY ("bID")
) 
WITH (
  OIDS = FALSE
)
;

