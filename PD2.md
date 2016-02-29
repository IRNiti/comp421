Project deliverable 2
======

### Question 4

1. View representing all the premium users

	View creation:
	```PLpgSQL
	CREATE VIEW premiumUsers AS
	  SELECT *
	  FROM "Users"
	  WHERE "isPremium" = TRUE;
	```

	Select query and result:
	```PLpgSQL
	SELECT *
	FROM premiumUsers
	WHERE points > 100;
	```

	<img src="http://i.imgur.com/vwJNJhK.png" />

	Update query and result:
	```PLpgSQL
	UPDATE premiumUsers
	SET points = points + 10;
	```

	<img src="http://i.imgur.com/55hv1tI.png" />
	===
2. View representing all the active reservations (i.e. the vehicles associated with the reservations haven't been returned yet)

	View creation:
	```PLpgSQL
	CREATE VIEW activeReservations AS
	  SELECT *
	  FROM "Reservations"
	  WHERE "isReturned" = FALSE;
	```

	Select query and result:
	```PLpgSQL
	SELECT *
	FROM activeReservations
	WHERE "returnDate" < current_date;
	```

	<img src="http://i.imgur.com/FMaoQkl.png" />

	Update query and result:
	```PLpgSQL
	UPDATE activeReservations
	SET "returnDate" = "returnDate" + 1;
	```

	<img src="http://i.imgur.com/w7kzZ6s.png" />
	===

Both of these views are updatable because they are simple enough to satisfy the constraints of an updatable view.
These conditions are:
- The view must have exactly one entry in its FROM list, which must be a table or another updatable view.
- The view definition must not contain WITH, DISTINCT, GROUP BY, HAVING, LIMIT, or OFFSET clauses at the top level.
- The view definition must not contain set operations (UNION, INTERSECT or EXCEPT) at the top level.
- All columns in the view's select list must be simple references to columns of the underlying relation. They cannot be expressions, literals or functions. System columns cannot be referenced, either.
- No column of the underlying relation can appear more than once in the view's select list.
- The view must not have the security_barrier property.
