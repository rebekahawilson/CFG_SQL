USE holiday_cabins;

-- Tables
select * from customer_addresses;
select * from customer_details; 
select * from cabins;
select * from bookings;
select * from booked_cabins; 
select * from activities;  
select * from booked_activities; 

-- Create a view for contact details, joining the customer details and addresses tables.
CREATE VIEW contact_details AS
	SELECT
		customer_id,
		first_name,
		last_name,
		email_address,
		phone,
		first_line,
		second_line,
		town,
		post_code
	FROM 
		customer_details AS cd
	LEFT JOIN
		customer_addresses AS ca ON cd.address_id = ca.address_id;
        
Select * FROM contact_details;

-- Create a view for cabin details
CREATE VIEW cabin_bookings_details AS
	SELECT
        cabin_name, 
        treehouse, 
        bedrooms, 
        guests, 
        price, 
        cabin_booking_id, 
        arrival_date,
        departure_date, 
        nights_booked, 
        date_booked, 
        first_name, 
        last_name, 
        phone,
        email_address, 
        nights_booked * price AS total_price
	FROM
		booked_cabins AS bc
	INNER JOIN
		cabins AS c ON c.cabin_id = bc.cabin_id
	INNER JOIN
		bookings AS b ON b.booking_id = bc.booking_id
	INNER JOIN
		customer_details AS cd ON cd.customer_id = b.customer_id
	ORDER BY 
		cabin_booking_id;

SELECT * FROM cabin_bookings_details;

-- View to see details about activity bookings
CREATE VIEW booked_activities_details AS
	SELECT
		activities_booked_id, 
        first_name, 
        last_name, 
        phone, 
        email_address,
        activity_name, 
        price, 
        date_of_activity, 
        quantity, 
        date_booked, 
        price * quantity AS total_activity_price
	FROM
		activities AS a
	INNER JOIN
		booked_activities AS ba ON ba.activity_id = a.activity_id
	INNER JOIN
		bookings AS b ON b.booking_id = ba.booking_id
	INNER JOIN
		customer_details AS cd ON cd.customer_id = b.customer_id
	ORDER BY
		activities_booked_id;

SELECT * FROM booked_activities_details;

-- Create a subquery to find where customers are visiting from in July
SELECT ca.town
FROM customer_addresses AS ca
WHERE address_id IN(
	SELECT cd.address_id
    FROM customer_details AS cd
    WHERE customer_ID IN(
		SELECT b.customer_ID
		FROM bookings AS b
		WHERE booking_id IN(
			SELECT bc.booking_ID
            FROM booked_cabins AS bc
            WHERE month(bc.arrival_date) = 07
            )
		)
	)
GROUP BY ca.town;

-- Create a stored function to apply a 10% discount to activities booked
DELIMITER // 
CREATE FUNCTION discounted_price(input_amount DECIMAL(7,2))
RETURNS DECIMAL(7,2)
DETERMINISTIC
BEGIN
	DECLARE output_amount DECIMAL(7,2);
    SET output_amount = input_amount -10/100*input_amount;
    RETURN output_amount;
END//
DELIMITER ;

-- Example of discount stored function
SELECT 
	activities_booked_id,
    total_activity_price,
    discounted_price(total_activity_price)AS total_after_discount
FROM
	booked_activities_details;

-- Create a trigger to add activities
DELIMITER //
CREATE TRIGGER activitiesItem_Before_Insert
BEFORE INSERT ON activities
FOR EACH ROW
BEGIN
	SET NEW.activity_name = CONCAT(UPPER(SUBSTRING(NEW.activity_name,1,1)),
							LOWER(SUBSTRING(NEW.activity_name FROM 2)));
END//
delimiter ; 

INSERT INTO activities 
	(activity_ID, activity_name, price)
VALUES
	(6, 'Dinner', 20.00)
    
-- Create a stored procedure to calculate how many bikes are needed for the cycling activity on a select day
DELIMITER //
CREATE PROCEDURE bikes_needed(on_date DATE)
BEGIN
	SELECT 
		SUM(quantity) AS total_bikes_needed
	FROM 
		Booked_activities AS ba
	WHERE activity_id IN (
		SELECT activity_id
		FROM activities AS a
		WHERE a.activity_name = 'Cycling')
		AND ba.date_of_activity = on_date;
END//
DELIMITER ;

-- Examples:
CALL bikes_needed('2023-12-13');

-- Create a stored procedure to calculate how many surfboards are needed on a select day
DELIMITER //
CREATE PROCEDURE surfboards_needed(on_date DATE)
BEGIN
	SELECT 
		SUM(quantity) AS total_surfboards_needed
	FROM 
		Booked_activities AS ba
	WHERE activity_id IN (
		SELECT activity_id
		FROM activities AS a
		WHERE a.activity_name = 'Surfing')
		AND ba.date_of_activity = on_date;
END//
DELIMITER ;

-- Examples:
CALL surfboards_needed('2023-12-13');

-- Query with group by
SELECT 
cabin_name,
treehouse,
booking_id
arrival_date
FROM 
	Cabins AS c 
JOIN 
	Booked_cabins AS bc ON bc.cabin_id = c.cabin_id
GROUP BY 
	c.cabin_id, 
	c.cabin_name, 
    c.treehouse, 
    bc.booking_id, 
    bc.arrival_date
HAVING
	c.treehouse = 0 
	and
	bc.arrival_date = '2023-07-09';