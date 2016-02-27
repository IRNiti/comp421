CREATE TABLE "cs421g04"."Users"
(
  "uID"       INTEGER           NOT NULL,
  name        CHARACTER VARYING NOT NULL,
  address     CHARACTER VARYING NOT NULL,
  email       CHARACTER VARYING NOT NULL,
  "isPremium" BOOLEAN           NOT NULL,
  points      INTEGER,
  CONSTRAINT "uID" PRIMARY KEY ("uID")
)
WITH (
OIDS = FALSE
);

CREATE TABLE "cs421g04"."InsurancePolicy"
(
  "typeOfCoverage" CHARACTER VARYING NOT NULL,
  price            DOUBLE PRECISION  NOT NULL,
  description      TEXT,
  PRIMARY KEY ("typeOfCoverage")
)
WITH (
OIDS = FALSE
);

CREATE TABLE "cs421g04"."Extras"
(
  "eID"        INTEGER           NOT NULL,
  name         CHARACTER VARYING NOT NULL,
  description  TEXT,
  "costPerDay" DOUBLE PRECISION,
  CONSTRAINT "Extras_pkey" PRIMARY KEY ("eID")
)
WITH (
OIDS =FALSE
);

CREATE TABLE "cs421g04"."Branches"
(
  "bID"   INTEGER           NOT NULL,
  address CHARACTER VARYING NOT NULL,
  PRIMARY KEY ("bID")
)
WITH (
OIDS = FALSE
);

CREATE TABLE "cs421g04"."Vehicles"
(
  "vID"          INTEGER           NOT NULL,
  make           CHARACTER VARYING NOT NULL,
  model          CHARACTER VARYING NOT NULL,
  "passCapacity" INTEGER           NOT NULL,
  "costPerDay"   DOUBLE PRECISION,
  type           CHARACTER VARYING NOT NULL,
  transmission   CHARACTER VARYING NOT NULL,
  "bID"          INTEGER           NOT NULL,
  PRIMARY KEY ("vID"),
  FOREIGN KEY ("bID") REFERENCES "cs421g04"."Branches" ("bID") ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
OIDS = FALSE
);

CREATE TABLE "cs421g04"."Reservations"
(
  "rID"            INTEGER           NOT NULL,
  "licenseNumber"  CHARACTER VARYING NOT NULL,
  "pickUpDate"     DATE              NOT NULL,
  "returnDate"     DATE,
  "isReturned"     BOOLEAN           NOT NULL DEFAULT FALSE,
  "uID"            INTEGER           NOT NULL,
  "vID"            INTEGER           NOT NULL,
  "typeOfCoverage" CHARACTER VARYING NOT NULL,
  PRIMARY KEY ("rID"),
  FOREIGN KEY ("uID") REFERENCES "cs421g04"."Users" ("uID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  FOREIGN KEY ("vID") REFERENCES "cs421g04"."Vehicles" ("vID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  FOREIGN KEY ("typeOfCoverage") REFERENCES "cs421g04"."InsurancePolicy" ("typeOfCoverage") ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
OIDS = FALSE
);

CREATE TABLE "cs421g04"."Bill"
(
  "billID"        INTEGER           NOT NULL,
  "amount"        DOUBLE PRECISION  NOT NULL,
  "date"          DATE              NOT NULL,
  "paymentMethod" CHARACTER VARYING NOT NULL,
  "isPaid"        BOOLEAN           NOT NULL DEFAULT FALSE,
  "rID"           INTEGER           NOT NULL,
  PRIMARY KEY ("billID"),
  FOREIGN KEY ("rID") REFERENCES "cs421g04"."Reservations" ("rID") ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
OIDS = FALSE
);

CREATE TABLE "cs421g04"."CreditCard"
(
  "cardNumber"     CHAR(16)    NOT NULL,
  "expiryDate"     DATE        NOT NULL,
  "cardHolderName" VARCHAR(30) NOT NULL,
  "uID"            INTEGER     NOT NULL,
  "billID"         INTEGER     NOT NULL,
  PRIMARY KEY ("cardNumber"),
  FOREIGN KEY ("uID") REFERENCES "cs421g04"."Users" ("uID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  FOREIGN KEY ("billID") REFERENCES "cs421g04"."Bill" ("billID") ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
OIDS = FALSE
);

CREATE TABLE "cs421g04"."Damage"
(
  "dID"         INTEGER NOT NULL PRIMARY KEY,
  "vID"         INTEGER NOT NULL,
  "description" TEXT    NOT NULL,
  "date"        DATE    NOT NULL,
  FOREIGN KEY ("vID") REFERENCES "cs421g04"."Vehicles" ("vID") ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
OIDS = FALSE
);

CREATE TABLE "cs421g04"."Review"
(
  "vID"      INTEGER     NOT NULL REFERENCES "cs421g04"."Vehicles" ("vID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  "userName" VARCHAR(30) NOT NULL,
  "text"     TEXT        NOT NULL,
  "date"     DATE        NOT NULL,
  "rating"   INTEGER     NOT NULL CHECK ("rating" >= 0 && rating <= 5),
  PRIMARY KEY ("vID", "userName")
)
WITH (
OIDS = FALSE
);

CREATE TABLE "cs421g04"."Upgrades"
(
  "vID" INTEGER NOT NULL REFERENCES "cs421g04"."Vehicles" ("vID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  "eID" INTEGER NOT NULL REFERENCES "cs421g04"."Extras" ("eID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  PRIMARY KEY ("vID", "eID")
)
WITH (
OIDS = FALSE
);

CREATE TABLE "cs421g04"."Dropoff"
(
  "rID" INTEGER NOT NULL REFERENCES "cs421g04"."Reservations" ("rID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  "bID" INTEGER NOT NULL REFERENCES "cs421g04"."Branches" ("bID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  PRIMARY KEY ("rID", "bID")
)
WITH (
OIDS = FALSE
);
