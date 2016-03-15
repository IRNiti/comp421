-- Create a Promotions table containing promotions that can be applied to reservations in order to get discounts
CREATE TABLE "Promotions"
(
  pid  SERIAL PRIMARY KEY NOT NULL,
  info XML                NOT NULL
);
CREATE UNIQUE INDEX """Promotions""_pid_uindex" ON "Promotions" (pid);

-- Create a one-to-many relation between the Promotions and Reservations
ALTER TABLE "Reservations"
  ADD promotion INT DEFAULT NULL NULL;
ALTER TABLE "Reservations"
  ADD CONSTRAINT Reservations_Promotions_pid_fk
FOREIGN KEY (promotion) REFERENCES "Promotions" (pid);

-- Return the names of users who have reservations associated with promotions that have already started
SELECT name
FROM "Reservations" r, "Users" u
WHERE r."uID" = u."uID"
      AND r.promotion IN (SELECT pid
                          FROM "Promotions"
                          WHERE
                            to_date(xpath('/promotion/startdate/text()', info) :: TEXT, '{YYYY-MM-DD}') < current_date);


-- Select pid of Promotions that offer a discount of more than 5% off
SELECT pid
FROM "Promotions"
WHERE (((((xpath('/promotion/percentoff/text()', info)) [1]) :: TEXT) :: INTEGER)) > 5;
