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
