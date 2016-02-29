-- Represents all the premium users
CREATE VIEW premiumUsers AS
  SELECT *
  FROM "Users"
  WHERE "isPremium" = TRUE;

-- Represents all the reservations that are currently active
-- i.e. the vehicles associated with them haven't been returned yet
CREATE VIEW activeReservations AS
  SELECT *
  FROM "Reservations"
  WHERE "isReturned" = FALSE;

-- Get the most valuable premium users
SELECT *
FROM premiumUsers
WHERE points > 100;

-- Get reservations that are past due
SELECT *
FROM activeReservations
WHERE "returnDate" < current_date;

-- Delay the return date for all active reservations by one day
UPDATE activeReservations
SET "returnDate" = "returnDate" + 1;
