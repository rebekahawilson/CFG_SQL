-- Create a database for a holiday resort with cabins and activities
CREATE DATABASE holiday_cabins;
USE holiday_cabins;

-- Creating Tables
-- Table for the customers addresses
create table customer_addresses (
   address_ID INTEGER NOT NULL, 
   first_line VARCHAR(50) NOT NULL, 
   second_line VARCHAR(50), 
   town VARCHAR(50), 
   post_code VARCHAR(10) NOT NULL, 
   primary key (address_ID)
);

-- table for customer details
create table customer_details (
   customer_ID INTEGER NOT NULL, 
   first_name VARCHAR(25) NOT NULL, 
   last_name VARCHAR(25) NOT NULL, 
   address_ID INTEGER NOT NULL,
   email_address VARCHAR(100) NOT NULL, 
   phone VARCHAR(20) NOT NULL, 
   primary key (customer_ID), 
   foreign key (address_ID) REFERENCES customer_addresses(address_ID)
); 

-- table for cabin information
create table cabins (
   cabin_ID INTEGER NOT NULL,
   cabin_name VARCHAR(55) NOT NULL,
   treehouse BOOLEAN,
   bedrooms VARCHAR(10) NOT NULL,
   guests VARCHAR (10) NOT NULL, 
   price FLOAT(2) NOT NULL,
   primary key (cabin_ID)
);

-- table for booking details
create table bookings (
   booking_ID INTEGER NOT NULL,
   date_booked DATE NOT NULL,
   customer_ID INTEGER NOT NULL,
   primary key (booking_ID), 
   foreign key (customer_ID) references customer_details(customer_ID)
);

-- table for details on which cabins have been booked
create table booked_cabins(
    cabin_booking_id INT NOT NULL AUTO_INCREMENT, 
    cabin_ID INT NOT NULL, 
    arrival_date DATE NOT NULL, 
    departure_date DATE NOT NULL, 
    nights_booked INT,
    booking_ID INT NOT NULL, 
    primary key (cabin_booking_id), 
    foreign key (cabin_ID) REFERENCES cabins(cabin_ID), 
    foreign key (booking_ID) REFERENCES bookings(booking_ID)
);

-- table for activities available
create table activities(
	activity_ID INTEGER NOT NULL,
    activity_name VARCHAR(50) NOT NULL,
    price FLOAT (2) NOT NULL,
    primary key (activity_ID)
);

-- table for holiday activity bookings
create table booked_activities(
	activities_booked_ID INT NOT NULL, 
    activity_ID INT NOT NULL, 
    date_of_activity DATE, 
    quantity INT NOT NULL, 
    booking_ID INT, 
    primary key (activities_booked_ID), 
    foreign key (activity_ID) REFERENCES activities(activity_ID), 
    foreign key (booking_ID) REFERENCES bookings(booking_ID)
);
 
-- Data entry into the tables
INSERT INTO customer_addresses
	(address_id, first_line, second_line, town, post_code)
VALUES
	(1, '5 Fisher Place', '', 'Thirlmere', 'CA12 4TW'), 
	(2, '18 Muncaster Way', '', 'West Haddon', 'NN6 7DU'),
	(3, '30 King Edward Street', '', 'Macclesfield', 'SK10 1AE'),
	(4, '1 Western Road', '', 'Crediton', 'EX17 3LZ'),
	(5, 'Tudorwell', 'Broad Bush', 'Blunsdon', 'SN26 7DH'),
	(6, '34 Kerr Close', '', 'Knebworth', 'SG3 6AB'),
	(7, '7 Station Road', '', 'Hessle', 'HU13 0BD'),
	(8, 'Penygraig', 'Quay Road', 'Goodwick', 'SA64 0BS'),
	(9, '31 Redcar Road', '', 'Guisborough', 'TS14 6HR'),
	(10, '5 Hookstone Grange Court', '', 'Harrogate', 'HG2 7BP'),
	(11, '35 Elmwood Drive', '', 'Blythe Bridge', 'ST11 9NE'),
	(12, '17 Stanion Lane', '', 'Corby', 'NN18 8ES'),
	(13, '116 Ketley Park Road', '', 'Ketley', 'TF1 5FA'),
	(14, '7 Paradise Road', '', 'Richmond', 'TW9 1RX'),
	(15, 'Highfields House', '23 The Kings Gap', 'Shrewsbury', 'SY3 9BJ'),
	(16, '5 Wigeon Close', '', 'Great Notley', 'CM77 7WB'),
	(17, 'Brow Edge', '', 'Drigg', 'CA19 1XS'),
	(18, '6 Kingsport Close', '', 'Stockton-On-Tees', 'TS18 2LE'),
	(19, '103 Forest Road', '', 'Northallerton', 'DL6 1LD'),
	(20, '18 Meadlands', '', 'Corston', 'BA2 9AS'),
	(21, '256 Brantingham Road', 'Chorlton-Cum-Hardy', 'Manchester', 'M21 0QZ'),
	(22, 'Pod 104 The Overstrand', 'Boscombe Promenade', 'Bournemouth', 'BH5 1BN'),
	(23, '8 Malvern Close', '', 'Ottershaw', 'KT16 0NY'),
	(24, '3 Lindum Way', '', 'Worthing', 'BN13 1LS'),
	(25, '22 Leslie Avenue', '', 'Hebburn',  'NE31 1XN'),
	(26, '48 Butterslade Grove', '', 'Ynysforgan', 'SA6 6QU');

INSERT INTO customer_details
	(customer_id, first_name, last_name, email_address, phone, address_id)
VALUES
	(1, 'Hillary', 'Riley', 'in.hendrerit.consectetuer@atrisusNunc.co.uk', '07768 743633', 1), 
	(2, 'Mari', 'Baldwin', 'ornare.facilisis@eliterat.org', '07327 767123', 2), 
	(3, 'Lysandra', 'Daniel', 'malesuada@lorem.edu', '07625 131765', 3), 
	(4, 'Indira', 'Marquez', 'non.lorem@consequatpurus.net', '(01363) 405417', 4), 
	(5, 'Jack', 'Massey', 'gravida@ametrisus.edu', '(01793) 182452', 5), 
	(6, 'Timon', 'Frost', 'molestie@scelerisquescelerisque.ca', '(01438) 180844', 6), 
	(7, 'Ahmed', 'Gregory', 'ornare.placerat.orci@pedeacurna.edu', '07265 845658', 7), 
	(8, 'Jemima', 'Adkins', 'enim@vulputateduinec.edu', '07115 228569', 8), 
	(9, 'Leah', 'Snow', 'a.felis.ullamcorper@feugiatSed.ca', '(01348) 355808', 8), 
	(10, 'Deanna', 'Simpson', 'libero.et.tristique@sit.edu', '(01423) 561214', 9), 
	(11, 'Hayfa', 'Gillespie', 'tellus.imperdiet.non@CuraePhasellus.net', '(01782) 736278', 10), 
	(12, 'Hu', 'Sweeney', 'In.tincidunt.congue@tinciduntorciquis.co.uk', '07778 544658', 11), 
	(13, 'Burton', 'Glover', 'dui.augue.eu@risusNuncac.org', '07665 592256', 12), 
	(14, 'Yoko', 'Sanford', 'eget.dictum.placerat@natoquepenatibus.com', '(01952) 160285', 12), 
	(15, 'Kane', 'Brooks', 'iaculis.quis.pede@fringillapurusmauris.edu', '07411 029080', 13), 
	(16, 'Damon', 'Welch', 'porttitor@massa.co.uk', '07633 665859', 14), 
	(17, 'Sybill', 'Berger', 'et.magnis@adlitora.ca', '(01376) 755648', 15), 
	(18, 'Gage', 'Moody', 'erat@orciDonecnibh.org', '(01642) 508634', 15), 
	(19, 'Darryl', 'Rollins', 'eu@Phaselluselit.org', '07845 651975', 16), 
	(20, 'Rama', 'Jones', 'Morbi.accumsan@metus.edu', '07494 156321', 17), 
	(21, 'Patricia', 'Vaughn', 'luctus.vulputate@Donecvitae.ca', '(0161) 351 1123', 18), 
	(22, 'Jameson', 'Stuart', 'nec.mauris.blandit@lacinia.com', '(01202) 624754', 19), 
	(23, 'Pandora', 'Dillard', 'sit.amet@eu.co.uk', '(01932) 626177', 20), 
	(24, 'Quyn', 'Mcmillan', 'sit.amet@elementumdui.com', '07465 215654', 21), 
	(25, 'Timothy', 'Barlow', 'a.mi@eget.edu', '07845 262336', 22);

INSERT INTO cabins
	(cabin_ID, cabin_name, treehouse, bedrooms, guests, price)
VALUES
	(1, 'Rabbit Hill', 0, 1, 2, 100.00), 
	(2, 'Trout Corner', 1, 2, 5, 150.00), 
	(3, 'Goose Hollow', 0, 2, 5, 200.00), 
	(4, 'Fox Run', 0, 1, 2,  125.00), 
	(5, 'Slipper Slope', 1, 2, 4,  170.00), 
	(6, 'Lavender Lodge', 1, 1, 2,  100.00), 
	(7, 'Daisy Hideaway', 0, 3, 5, 200.00), 
	(8, 'Swollow’s Nest', 1, 2, 3, 130.00), 
	(9, 'Wildflower Hutch', 1, 1, 2, 100.00), 
	(10, 'Willow Grove', 0, 2, 5, 240.00), 
	(11, 'Oak Nook', 0, 3, 6, 250.00), 
	(12, 'Sunset End', 0, 4, 8, 300.00);
    
insert into bookings
	(booking_ID, date_booked, customer_ID)
values
	(1, '2023-01-01', 25),
	(2, '2023-01-23', 3),
	(3, '2023-02-02', 8),
	(4, '2023-02-07', 15),
	(5, '2023-03-01', 18), 
	(6, '2023-03-02', 22),
	(7, '2023-04-27', 20),
	(8, '2023-05-08', 19),
	(9, '2023-05-09', 17), 
	(10, '2023-05-10', 7), 
	(11, '2023-05-11', 4),
	(12, '2023-05-16', 9),
	(13, '2023-05-19', 1), 
	(14, '2023-05-20', 25), 
	(15, '2023-05-22', 2), 
	(16, '2023-05-27', 20), 
	(17, '2023-06-01', 24), 
	(18, '2023-06-11', 5), 
	(19, '2023-06-17', 1), 
	(20, '2023-07-20', 23), 
	(21, '2023-07-28', 6),
	(22, '2023-08-08', 8),
	(23, '2023-09-09', 16), 
	(24, '2023-09-10', 6), 
	(25, '2023-10-10', 14), 
	(26, '2023-10-20', 11), 
	(27, '2023-11-01', 8), 
	(28, '2023-11-11', 13), 
	(29, '2023-11-18', 21), 
	(30, '2023-12-01', 12);

INSERT INTO booked_cabins
	(cabin_booking_id, cabin_ID, arrival_date, departure_date, booking_id)
VALUES
	(1, 7, '2023-07-09', '2023-07-13', 1),
	(2, 8, '2023-07-17', '2023-07-19', 2),  
	(3, 1, '2023-07-09', '2023-07-11', 3),
	(4, 11, '2023-07-03', '2023-07-07', 4), 
	(5, 6, '2023-07-08', '2023-07-12', 5),
	(6, 6, '2023-07-17', '2023-07-19', 6), 
	(7, 10, '2023-07-22', '2023-07-26', 7), 
	(8, 10, '2023-07-16', '2023-07-19', 8),
	(9, 11, '2023-07-20', '2023-07-26', 9), 
	(10, 11, '2023-07-11', '2023-07-15', 10),
	(11, 2, '2023-07-11', '2023-07-15', 10),
	(12, 9, '2023-07-31', '2023-08-02', 11), 
	(13, 12, '2023-07-29', '2023-08-03', 12), 
	(14, 6, '2023-07-03', '2023-07-06', 13), 
	(15, 3, '2023-07-03', '2023-07-05', 14),
	(16, 5, '2023-07-14', '2023-07-17', 15),  
	(17, 9, '2023-07-18', '2023-07-25', 16), 
	(18, 3, '2023-07-18', '2023-07-25', 16), 
	(19, 4, '2023-07-18', '2023-07-25', 16),
	(20, 3, '2023-07-07', '2023-07-12', 17), 
	(21, 4, '2023-07-03', '2023-07-05', 18), 
	(22, 12, '2023-07-10', '2023-07-17', 19),
	(23, 2, '2023-08-01', '2023-08-05', 20), 
	(24, 10, '2023-07-30', '2023-08-02', 21), 
	(25, 8, '2023-07-24', '2023-07-25', 22),
	(26, 7, '2023-07-22', '2023-07-27', 23), 
	(27, 4, '2023-07-28', '2023-07-31', 24), 
	(28, 5, '2023-07-24', '2023-07-26', 25), 
	(29, 5, '2023-07-31', '2023-08-03', 26), 
	(30, 4, '2023-08-07', '2023-08-09', 27); 

-- calculate total nights in cabins_booked
UPDATE booked_cabins
SET nights_booked = DATEDIFF(departure_date, arrival_date);

insert into activities
	(activity_ID, activity_name, price)
values 
	(1, 'Surfing', 50.00),
	(2, 'Spa', 30.00),
	(3, 'Hiking Trail', 15.00),
	(4, 'Crafts', 10.00),
	(5, 'Cycling', 25.00);

insert into booked_activities
	(activities_booked_ID, activity_ID, date_of_activity, quantity, booking_ID)
values
	(1, 1, '2023-07-12', 1, 1),
	(2, 1, '2023-08-12', 2, 2),
	(3, 2, '2023-12-12', 3, 5),
	(4, 2, '2023-12-12', 1, 4),
	(5, 5, '2023-09-13', 3, 4), 
	(6, 3, '2023-12-13', 2, 13), 
	(7, 4, '2023-12-13', 4, 15), 
	(8, 4, '2023-07-13', 5, 15),  
	(9, 1, '2023-12-13', 1, 16), 
	(10, 2, '2023-12-14', 1, 17), 
	(11, 3, '2023-05-14', 2, 18), 
	(12, 1, '2023-12-12', 4, 21),
	(13, 4, '2023-12-12', 3, 1),
	(14, 1, '2023-06-14', 3, 19), 
	(15, 2, '2023-12-14', 4, 20), 
	(16, 1, '2023-12-15', 2, 21), 
	(17, 3, '2023-07-15', 2, 22), 
	(18, 1, '2023-12-15', 1, 23), 
	(19, 1, '2023-12-15', 2, 24), 
	(20, 2, '2023-12-16', 2, 25), 
	(21, 2, '2023-07-17', 1, 26), 
	(22, 4, '2023-12-17', 5, 27),
	(23, 5, '2023-12-17', 2, 28), 
	(24, 3, '2023-12-17', 4, 29), 
	(25, 1, '2023-07-18', 3, 16), 
	(26, 2, '2023-12-18', 2, 9), 
	(27, 5, '2023-12-19', 2, 19), 
	(28, 4, '2023-12-19', 4, 10), 
	(29, 2, '2023-12-19', 4, 13), 
	(30, 1, '2023-07-19', 5, 1);

-- checking all tables have been populated correctly 
select * from customer_addresses;
select * from customer_details; 
select * from cabins;
select * from bookings;
select * from booked_cabins; 
select * from activities;  
select * from booked_activities; 