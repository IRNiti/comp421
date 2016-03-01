ALTER TABLE cs421g04."Bill" ADD CONSTRAINT priceCheck CHECK ("amount">=0);
ALTER TABLE cs421g04."Vehicles" ADD CONSTRAINT costCheck CHECK ("costPerDay">=0);
