/**
 Create an index on the user ID attribute of the reservations table
 This will speed up queries looking for reservations where the user ID is known,
 such as the one used when displaying a certain user's reservations.
 */
CREATE INDEX "Reservations_uID_index" ON "Reservations" ("uID");

/**
 Create an index on the branch ID attribute of the vehicles table
 This will speed up queries looking for vehicles where the branch ID is known,
 such as the one used when listing all the vehicles belonging to a certain branch.
 */
CREATE INDEX "Vehicles_bID_index" ON "Vehicles" ("bID");
