SET SEARCH_PATH TO "cs421g04";

CREATE SEQUENCE unique_userid;
CREATE TABLE "Users"
(
  "uID"       INTEGER           NOT NULL DEFAULT nextval('unique_userid'),
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

CREATE TABLE "InsurancePolicy"
(
  "typeOfCoverage" CHARACTER VARYING NOT NULL,
  price            DOUBLE PRECISION  NOT NULL,
  description      TEXT,
  PRIMARY KEY ("typeOfCoverage")
)
WITH (
OIDS = FALSE
);

CREATE SEQUENCE unique_eid;
CREATE TABLE "Extras"
(
  "eID"        INTEGER           NOT NULL DEFAULT nextval('unique_eid'),
  name         CHARACTER VARYING NOT NULL,
  description  TEXT,
  "costPerDay" DOUBLE PRECISION,
  CONSTRAINT "Extras_pkey" PRIMARY KEY ("eID")
)
WITH (
OIDS =FALSE
);

CREATE SEQUENCE unique_bid;
CREATE TABLE "Branches"
(
  "bID"   INTEGER           NOT NULL DEFAULT nextval('unique_bid'),
  address CHARACTER VARYING NOT NULL,
  PRIMARY KEY ("bID")
)
WITH (
OIDS = FALSE
);

CREATE SEQUENCE unique_vid;
CREATE TABLE "Vehicles"
(
  "vID"          INTEGER           NOT NULL DEFAULT nextval('unique_vid'),
  make           CHARACTER VARYING NOT NULL,
  model          CHARACTER VARYING NOT NULL,
  "passCapacity" INTEGER           NOT NULL,
  "costPerDay"   DOUBLE PRECISION,
  type           CHARACTER VARYING NOT NULL,
  transmission   CHARACTER VARYING NOT NULL,
  "bID"          INTEGER           NOT NULL,
  PRIMARY KEY ("vID"),
  FOREIGN KEY ("bID") REFERENCES "Branches" ("bID") ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
OIDS = FALSE
);

CREATE SEQUENCE unique_rid;
CREATE TABLE "Reservations"
(
  "rID"            INTEGER           NOT NULL DEFAULT nextval('unique_rid'),
  "licenseNumber"  CHARACTER VARYING NOT NULL,
  "pickUpDate"     DATE              NOT NULL,
  "returnDate"     DATE,
  "isReturned"     BOOLEAN           NOT NULL DEFAULT FALSE,
  "uID"            INTEGER           NOT NULL,
  "vID"            INTEGER           NOT NULL,
  "typeOfCoverage" CHARACTER VARYING NOT NULL,
  PRIMARY KEY ("rID"),
  FOREIGN KEY ("uID") REFERENCES "Users" ("uID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  FOREIGN KEY ("vID") REFERENCES "Vehicles" ("vID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  FOREIGN KEY ("typeOfCoverage") REFERENCES "InsurancePolicy" ("typeOfCoverage") ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
OIDS = FALSE
);

CREATE SEQUENCE unique_billid;
CREATE TABLE "Bill"
(
  "billID"        INTEGER           NOT NULL DEFAULT nextval('unique_billid'),
  "amount"        DOUBLE PRECISION  NOT NULL,
  "date"          DATE              NOT NULL,
  "paymentMethod" CHARACTER VARYING NOT NULL,
  "isPaid"        BOOLEAN           NOT NULL DEFAULT FALSE,
  "rID"           INTEGER           NOT NULL,
  PRIMARY KEY ("billID"),
  FOREIGN KEY ("rID") REFERENCES "Reservations" ("rID") ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
OIDS = FALSE
);

CREATE TABLE "CreditCard"
(
  "cardNumber"     CHAR(16)    NOT NULL,
  "expiryDate"     DATE        NOT NULL,
  "cardHolderName" VARCHAR(30) NOT NULL,
  "uID"            INTEGER     NOT NULL,
  "billID"         INTEGER     NOT NULL,
  PRIMARY KEY ("cardNumber"),
  FOREIGN KEY ("uID") REFERENCES "Users" ("uID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  FOREIGN KEY ("billID") REFERENCES "Bill" ("billID") ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
OIDS = FALSE
);

CREATE SEQUENCE unique_damid;
CREATE TABLE "Damage"
(
  "dID"         INTEGER NOT NULL  DEFAULT nextval('unique_damid'),
  "vID"         INTEGER NOT NULL REFERENCES "Vehicles" ("vID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  "description" TEXT    NOT NULL,
  "date"        DATE    NOT NULL,
  PRIMARY KEY ("vID", "dID")
)
WITH (
OIDS = FALSE
);

CREATE TABLE "Review"
(
  "vID"      INTEGER     NOT NULL REFERENCES "Vehicles" ("vID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  "userName" VARCHAR(30) NOT NULL,
  "text"     TEXT        NOT NULL,
  "date"     DATE        NOT NULL,
  "rating"   INTEGER     NOT NULL CHECK ("rating" >= 0 AND "rating" <= 5),
  PRIMARY KEY ("vID", "userName")
)
WITH (
OIDS = FALSE
);

CREATE TABLE "Upgrades"
(
  "vID" INTEGER NOT NULL REFERENCES "Vehicles" ("vID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  "eID" INTEGER NOT NULL REFERENCES "Extras" ("eID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  PRIMARY KEY ("vID", "eID")
)
WITH (
OIDS = FALSE
);

CREATE TABLE "Dropoff"
(
  "rID" INTEGER NOT NULL REFERENCES "Reservations" ("rID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  "bID" INTEGER NOT NULL REFERENCES "Branches" ("bID") ON UPDATE NO ACTION ON DELETE NO ACTION,
  PRIMARY KEY ("rID", "bID")
)
WITH (
OIDS = FALSE
);
