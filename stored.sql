set search_path to cs421g04;
create type userSpent as (uid integer, spent integer);
CREATE OR REPLACE FUNCTION totalRecords()
RETURNS setof userSpent AS $total$
declare
	r integer;
	a  integer;
	total integer;
	r2 integer;
	j integer:=0;
	rec userSpent;
	reclist userSpent[];
BEGIN
	for r in select "uID" from "Users" where "isPremium" is true
	loop
		total:= 0;
		for r2 in select "rID" from "Reservations" where "uID" = r
		loop
			a:=(select "amount" from "Bill" where "rID"= r2 and "isPaid" is true);
			if a is null then
			else total := total + a;
			end if;
		end loop;
		if total is null then
			total:=0;
		end if;
		rec :=(r::integer,total::integer);
		reclist[j]:=rec;
		j:=j+1;
	end loop;

	foreach rec in array reclist
	loop
		if rec.spent >0 then 
			update "Users" 
			set "points" = rec.spent/10 
			where "uID" = rec.uid;
		end if;
		return next rec;
	end loop;

END;
$total$ LANGUAGE plpgsql;

select * from totalRecords();