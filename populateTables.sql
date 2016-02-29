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

INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('A1234-071182-01', '2016-02-27 13:45:16', '2016-02-29 13:45:16', '0', 1, 1, 'N/A');
INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('A1235-170495-11', '2016-02-24 13:45:16', '2016-02-27 13:45:16', '0', 2, 3, 'loss-damage waiver');
INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('A1231-280289-05', '2016-02-27 13:45:16', '2016-03-01 13:45:16', '0', 3, 5, 'liability coverage');
INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('A1238-301273-09', '2016-02-27 13:45:16', '2016-03-04 13:45:16', '0', 4, 7, 'personal accident insurance');
INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('A1239-191093-03', '2016-02-27 13:45:16', '2016-02-29 13:45:16', '0', 5, 9, 'personal effects coverage');
INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('L5784-140285-07', '2015-09-23 13:45:16', '2015-09-27 13:45:16', '1', 2, 12, 'personal accident insurance');
INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('L4578-020576-03', '2015-09-29 13:45:16', '2015-10-03 13:45:16', '1', 3, 2, 'personal accident insurance');
INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('L0034-210691-05', '2015-10-03 13:45:16', '2015-10-05 13:45:16', '1', 4, 7, 'personal effects coverage');
INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('L2434-100791-02', '2015-10-07 13:45:16', '2015-10-12 13:45:16', '0', 5, 12, 'liability coverage');
INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('M3521-201187-08', '2015-10-07 13:45:16', '2015-10-10 13:45:16', '1', 1, 5, 'loss-damage waiver');
INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('T3465-190563-11', '2015-10-09 13:45:16', '2015-10-15 13:45:16', '1', 2, 3, 'personal effects coverage');
INSERT INTO "cs421g04"."Reservations" ("licenseNumber", "pickUpDate", "returnDate", "isReturned", "uID", "vID", "typeOfCoverage") VALUES ('S3782-030784-10', '2015-10-10 13:45:16', '2015-10-15 13:45:16', '1', 3, 6, 'personal accident insurance');

INSERT INTO "cs421g04"."Bill" ("amount", "date", "paymentMethod", "isPaid", "rID") VALUES (200, '2016-02-26 13:45:16', 'VISA', '1', 1);
INSERT INTO "cs421g04"."Bill" ("amount", "date", "paymentMethod", "isPaid", "rID") VALUES (300, '2016-02-23 13:45:16', 'VISA', '1', 2);
INSERT INTO "cs421g04"."Bill" ("amount", "date", "paymentMethod", "isPaid", "rID") VALUES (400, '2016-02-26 13:45:16', 'MasterCard', '1', 3);
INSERT INTO "cs421g04"."Bill" ("amount", "date", "paymentMethod", "isPaid", "rID") VALUES (450, '2016-02-26 13:45:16', 'Debit', '1', 4);
INSERT INTO "cs421g04"."Bill" ("amount", "date", "paymentMethod", "isPaid", "rID") VALUES (500, '2016-02-26 13:45:16', 'Cash', '0', 5);

INSERT INTO "cs421g04"."Damage" ("vID", "description", "date") VALUES (2, 'Accident occured when I did not check my blind spot so there is a dent in the right front door', '2016-01-16 13:45:16');
INSERT INTO "cs421g04"."Damage" ("vID", "description", "date") VALUES (5, 'Rear ended at a stop sign', '2016-01-16 13:45:16');
INSERT INTO "cs421g04"."Damage" ("vID", "description", "date") VALUES (8, 'Drunk driving and hit a tree', '2016-12-16 13:45:16');
INSERT INTO "cs421g04"."Damage" ("vID", "description", "date") VALUES (11, 'Slippery road conditions caused the car to slide into a snow bank', '2016-11-16 13:45:16');
INSERT INTO "cs421g04"."Damage" ("vID", "description", "date") VALUES (14, 'Driving too fast around a curve', '2016-09-16 13:45:16');
INSERT INTO "cs421g04"."Damage" ("vID", "description", "date") VALUES (15, 'A car ran a red light and hit me in the intersection', '2016-01-06 13:45:16');
INSERT INTO "cs421g04"."Damage" ("vID", "description", "date") VALUES (16, 'Backed up without looking and bumped a car', '2016-07-16 13:45:16');
INSERT INTO "cs421g04"."Damage" ("vID", "description", "date") VALUES (1, 'Collided with a truck', '2014-08-16 13:45:16');

INSERT INTO cs421g04."Review" ("vID", "userName", text, date, rating) VALUES (1, 'Idrivelongtimee', 'This is a good, very reliable, cheap to operate little car. No bueno when there is more than a few inchees of snow, but you can''t expect much.', '2016-02-18', 5);
INSERT INTO cs421g04."Review" ("vID", "userName", text, date, rating) VALUES (3, 'Joe Rindfuss', 'My main complaint is the Navigation System – I would recommend skipping this option and buying a GPS since the Chrysler navigation system WILL get you lost.', '2015-11-16', 4);
INSERT INTO cs421g04."Review" ("vID", "userName", text, date, rating) VALUES (5, 'Nik', 'the alignment or something is off... You can''t hold the damn car straight in one lane. No matter how straight and steady you hold the steering wheel, you still end up swerving and veering into someone else''s lane. Additional complaint: the worst acceleration that I''ve ever experienced in a vehicle... good luck pulling a heel.', '2015-09-12', 1);
INSERT INTO cs421g04."Review" ("vID", "userName", text, date, rating) VALUES (6, 'lltautomobile', 'This is still the king of family haulers. It is comfortable and has a smooth ride. Quiet interior with little road noise.', '2015-04-13', 4);
INSERT INTO cs421g04."Review" ("vID", "userName", text, date, rating) VALUES (8, 'Kris C.', 'The design is great. The ride is comfortable. The steering is smooth and effortless. The engine is quiet and moderately powerful. The HVAC performs flawlessly.', '2016-02-26', 5);
INSERT INTO cs421g04."Review" ("vID", "userName", text, date, rating) VALUES (10, 'Dan', 'Purchased this 2013 limited used in 2014 and have owned it about one year. Nicest car I''ve ever owned. It looks nice, drives well, is quiet and very comfortable. I haven''t had any problems with it.', '2015-07-27', 5);
INSERT INTO cs421g04."Review" ("vID", "userName", text, date, rating) VALUES (19, 'Denny Y', 'Ford finally put quality into the ''15 Stang! This sexy eye catcher is a great summer ride. Rides and handles like a dream and is extremely comfortable. My only complaint is the poor grip on wet and almost dangerous on snowy roads even with their std All Weather Eagle GTs.', '2015-12-31', 5);

INSERT INTO cs421g04."CreditCard" ("cardNumber", "expiryDate", "cardHolderName", "uID", "billID") VALUES ('5239012573033351', '2017-09-01', 'Bernie Kaminski', 1, 1);
INSERT INTO cs421g04."CreditCard" ("cardNumber", "expiryDate", "cardHolderName", "uID", "billID") VALUES ('4532813348142725', '2019-03-01', 'Raluca Niti', 2, 2);
INSERT INTO cs421g04."CreditCard" ("cardNumber", "expiryDate", "cardHolderName", "uID", "billID") VALUES ('5423695974215225', '2017-10-01', 'Teo Baranga', 3, 3);
INSERT INTO cs421g04."CreditCard" ("cardNumber", "expiryDate", "cardHolderName", "uID", "billID") VALUES ('5109469779509195', '2020-08-01', 'Tony Nguyen', 4, 4);

INSERT INTO "cs421g04"."Dropoff" ("rID", "bID") VALUES (1, 2);
INSERT INTO "cs421g04"."Dropoff" ("rID", "bID") VALUES (2, 2);
INSERT INTO "cs421g04"."Dropoff" ("rID", "bID") VALUES (3, 3);
INSERT INTO "cs421g04"."Dropoff" ("rID", "bID") VALUES (4, 4);
INSERT INTO "cs421g04"."Dropoff" ("rID", "bID") VALUES (5, 1);
INSERT INTO "cs421g04"."Dropoff" ("rID", "bID") VALUES (6, 3);
INSERT INTO "cs421g04"."Dropoff" ("rID", "bID") VALUES (7, 5);
INSERT INTO "cs421g04"."Dropoff" ("rID", "bID") VALUES (8, 4);
INSERT INTO "cs421g04"."Dropoff" ("rID", "bID") VALUES (9, 1);
INSERT INTO "cs421g04"."Dropoff" ("rID", "bID") VALUES (10, 5);
INSERT INTO "cs421g04"."Dropoff" ("rID", "bID") VALUES (11, 3);
INSERT INTO "cs421g04"."Dropoff" ("rID", "bID") VALUES (12, 2);

INSERT INTO "cs421g04"."Extras" (name, description, "costPerDay") VALUES ('Child Safety & Booster Seats', 'Safety 1st Kinrod Booster Car Seat', 10);
INSERT INTO "cs421g04"."Extras" (name, description, "costPerDay") VALUES ('GPS', 'Garmin Nvi 56lm Gps', 15);
INSERT INTO "cs421g04"."Extras" (name, description, "costPerDay") VALUES ('Roadside Assistance', 'Fast, reliable assistance when stranded on the highway, ran out of fuel or locked keys in rental car', 25);
INSERT INTO "cs421g04"."Extras" (name, description, "costPerDay") VALUES ('Fuel Plans', 'Option to have us refuel your rental car at specified locations', 20);

INSERT INTO "cs421g04"."Upgrades" ("vID", "eID") VALUES (1, 3);
INSERT INTO "cs421g04"."Upgrades" ("vID", "eID") VALUES (3, 1);
INSERT INTO "cs421g04"."Upgrades" ("vID", "eID") VALUES (7, 2);
INSERT INTO "cs421g04"."Upgrades" ("vID", "eID") VALUES (10, 4);
INSERT INTO "cs421g04"."Upgrades" ("vID", "eID") VALUES (5, 1);
INSERT INTO "cs421g04"."Upgrades" ("vID", "eID") VALUES (9, 1);