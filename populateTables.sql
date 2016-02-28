INSERT INTO "cs421g04"."Branches" (address) VALUES ('475 President Kennedy');
INSERT INTO "cs421g04"."Branches" (address) VALUES ('5960 Boulevard Decarie');
INSERT INTO "cs421g04"."Branches" (address) VALUES ('1717 Rue Berri');
INSERT INTO "cs421g04"."Branches" (address) VALUES ('3480 Boulevard Des Sources');
INSERT INTO "cs421g04"."Branches" (address) VALUES ('1555 Cure Labelle');

-- Cars: Economy, Compact, Mid-size, Standard, Full-size, Premium, Luxury, SUV, and Van.
INSERT INTO "cs421g04"."Vehicles" (make, model, "passCapacity", "costPerDay", type, transmission, "bID") VALUES ('Hyundai', 'Accent', 5, 70, 'Compact', 'Automatic', 1);
INSERT INTO "cs421g04"."Vehicles" (make, model, "passCapacity", "costPerDay", type, transmission, "bID") VALUES ('Hyundai', 'Accent', 5, 70, 'Compact', 'Manual', 1);
INSERT INTO "cs421g04"."Vehicles" (make, model, "passCapacity", "costPerDay", type, transmission, "bID") VALUES ('Chrysler', 'Grand Cherokee', 5, 120, 'SUV', 'Automatic', 1);
INSERT INTO "cs421g04"."Vehicles" (make, model, "passCapacity", "costPerDay", type, transmission, "bID") VALUES ('Hyundai', 'Elantra', 5, 85, 'Mid-size', 'Automatic', 2);
INSERT INTO "cs421g04"."Vehicles" (make, model, "passCapacity", "costPerDay", type, transmission, "bID") VALUES ('Hyundai', 'Elantra', 5, 85, 'Mid-size', 'Manual', 2);
INSERT INTO "cs421g04"."Vehicles" (make, model, "passCapacity", "costPerDay", type, transmission, "bID") VALUES ('GM', 'Yukon XL', 8, 150, 'SUV', 'Automoatic', 2);
INSERT INTO "cs421g04"."Vehicles" (make, model, "passCapacity", "costPerDay", type, transmission, "bID") VALUES ('Hyundai', 'Sonata', 5, 90, 'Full-size', 'Automatic', 3);
INSERT INTO "cs421g04"."Vehicles" (make, model, "passCapacity", "costPerDay", type, transmission, "bID") VALUES ('Hyundai', 'Sonata', 5, 90, 'Full-size', 'Manual', 3);
INSERT INTO "cs421g04"."Vehicles" (make, model, "passCapacity", "costPerDay", type, transmission, "bID") VALUES ('Chrysler', 'Grand Caravan', 7, 140, 'Van', 'Automatic', 3);
INSERT INTO "cs421g04"."Vehicles" (make, model, "passCapacity", "costPerDay", type, transmission, "bID") VALUES ('Ford', 'Taurus', 5, 100, 'Premium', 'Automatic', 4);
INSERT INTO "cs421g04"."Vehicles" (make, model, "passCapacity", "costPerDay", type, transmission, "bID") VALUES ('Ford', 'Taurus', 5, 100, 'Premium', 'Manual', 4);
INSERT INTO "cs421g04"."Vehicles" (make, model, "passCapacity", "costPerDay", type, transmission, "bID") VALUES ('Chrysler', '200 Convertible', 4, 120, 'Luxury', 'Automatic', 4);
INSERT INTO "cs421g04"."Vehicles" (make, model, "passCapacity", "costPerDay", type, transmission, "bID") VALUES ('Ford', 'Lincoln MKS', 5, 110, 'Luxury', 'Automatic', 5);
INSERT INTO "cs421g04"."Vehicles" (make, model, "passCapacity", "costPerDay", type, transmission, "bID") VALUES ('Ford', 'Lincoln MKS', 5, 110, 'Luxury', 'Manual', 5);
INSERT INTO "cs421g04"."Vehicles" (make, model, "passCapacity", "costPerDay", type, transmission, "bID") VALUES ('Ford', 'Mustang GT Convertible', 5, 140, 'Luxury', 'Manual', 5);

INSERT INTO "cs421g04"."InsurancePolicy" ("typeOfCoverage", price, description) VALUES ('N/A', 0, 'No coverage');
INSERT INTO "cs421g04"."InsurancePolicy" ("typeOfCoverage", price, description) VALUES ('loss-damage waiver', 50, 'Damage waiver or, as it is often referred to, collision damage waiver (CDW) or loss damage waiver (LDW), is optional damage insurance coverage that is available to you when you rent a car.
Car rental companies treat the CDW as a waiver of their right to make the renter pay for damages to the car.');

INSERT INTO "cs421g04"."InsurancePolicy" ("typeOfCoverage", price, description) VALUES ('liability coverage', 75, 'Liability car insurance covers damages to another person resulting from an accident you cause.');
INSERT INTO "cs421g04"."InsurancePolicy" ("typeOfCoverage", price, description) VALUES ('personal accident insurance', 100, 'Personal Accident Insurance (PAI) provides accidental death benefits and emergency medical expense benefits to the renter and all passengers in the car');
INSERT INTO "cs421g04"."InsurancePolicy" ("typeOfCoverage", price, description) VALUES ('personal effects coverage', 125, 'Personal Effects Protection insures the personal belongings of the renter and the immediate family members who are traveling with the renter.');

INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('A1234-123456-01', '2016-02-27 13:45:16', '2016-02-29 13:45:16', '0', 1, 1, 'N/A');
INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('A1235-123456-01', '2016-02-24 13:45:16', '2016-02-27 13:45:16', '0', 2, 3, 'loss-damage waiver');
INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('A1231-123456-01', '2016-02-27 13:45:16', '2016-03-01 13:45:16', '0', 3, 5, 'liability coverage');
INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('A1238-123456-01', '2016-02-27 13:45:16', '2016-03-04 13:45:16', '0', 4, 7, 'personal accident insurance');
INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('A1239-123456-01', '2016-02-27 13:45:16', '2016-02-29 13:45:16', '0', 5, 9, 'personal effects coverage');

INSERT INTO "cs421g04"."Bill" ("amount", "date", "paymentMethod", "isPaid", "rID") VALUES (200, '2016-02-26 13:45:16', 'VISA', '1', 1);
INSERT INTO "cs421g04"."Bill" ("amount", "date", "paymentMethod", "isPaid", "rID") VALUES (200, '2016-02-23 13:45:16', 'VISA', '1', 2);
INSERT INTO "cs421g04"."Bill" ("amount", "date", "paymentMethod", "isPaid", "rID") VALUES (200, '2016-02-26 13:45:16', 'MasterCard', '1', 3);
INSERT INTO "cs421g04"."Bill" ("amount", "date", "paymentMethod", "isPaid", "rID") VALUES (200, '2016-02-26 13:45:16', 'Debit', '1', 4);
INSERT INTO "cs421g04"."Bill" ("amount", "date", "paymentMethod", "isPaid", "rID") VALUES (200, '2016-02-26 13:45:16', 'Cash', '0', 5);
