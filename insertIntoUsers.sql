-- attribute uID is not specified because it has an auto-increment property so it was always be unique
INSERT INTO "cs421g04"."Users" (name, address, email, "isPremium", points) VALUES ('Bernie Kaminski', '2020 University', 'bernie@gmail.com', '1', 500);
INSERT INTO "cs421g04"."Users" (name, address, email, "isPremium", points) VALUES ('Raluca Niti', '730 Laval Avenue', 'raluca@gmail.com', '1', 500);
INSERT INTO "cs421g04"."Users" (name, address, email, "isPremium", points) VALUES ('Teo Baranga', '1001 Stanley', 'teo@gmail.com', '1', 500);
INSERT INTO "cs421g04"."Users" (name, address, email, "isPremium", points) VALUES ('Tony Nguyen', '2997 Edmond', 'tony@gmail.com', '1', 500);
INSERT INTO "cs421g04"."Users" (name, address, email, "isPremium", points) VALUES ('Anita Job', '421 Westmount Avenue', 'anita@mail.mcgill.ca', '0', 0);

select * from "cs421g04"."Users";