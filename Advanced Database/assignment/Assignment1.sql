
-- Payment--
CREATE TABLE Payment
( 
      payment_id char(10) NOT NULL PRIMARY KEY,
      payment_method varchar(20) NOT NULL,
      payment_status varchar(20) NOT NULL CHECK (payment_status IN('Pending','Completed'))
);

INSERT INTO Payment (payment_id, payment_method, payment_status)
VALUES
	('PAY0000001', 'Credit Card', 'Completed'),
 	('PAY0000002', 'Debit Card', 'Completed'),
	('PAY0000003', 'Gift Card', 'Completed'),
 	('PAY0000004', 'E-Wallet', 'Pending'),
	('PAY0000005', 'Credit Card', 'Completed'),
 	('PAY0000006', 'Debit Card', 'Pending'),
	('PAY0000007', 'E-Wallet', 'Completed'),
 	('PAY0000008', 'Debit Card', 'Completed'),
	('PAY0000009', 'Debit Card', 'Pending'),
 	('PAY0100000', 'Credit Card', 'Completed')


-- Customer --
CREATE TABLE Customer
( 
	cust_id char(10) NOT NULL PRIMARY KEY,
	first_name varchar(15) NOT NULL,   
	last_name varchar(15) NOT NULL,
	email_address varchar(50) NOT NULL,
	phone_number varchar(20) NOT NULL,
	membership_type varchar(10) NOT NULL CHECK (membership_type IN ('Member', 'Non-Member')),
	join_date date 
);

INSERT INTO Customer (cust_id, first_name, last_name, email_address, phone_number, membership_type, join_date)
VALUES
    ('CUS0000001', 'Alice', 'Anderson', 'alice@gmail.com', '012-456-7890', 'Non-Member', '2023-01-01'),
    ('CUS0000002', 'Bob', 'Brown', 'bob@gmail.com','010-654-3210', 'Member', '2023-01-02'),
    ('CUS0000003', 'Charlie', 'Clark', 'charlie@gmail.com', '011-789-0123', 'Member', '2023-01-03'),
    ('CUS0000004', 'David', 'Davis', 'david@gmail.com', '018-012-3456', 'Member', '2023-01-04'),
    ('CUS0000005', 'Eva', 'Evans', 'eva@gmail.com', '018-345-6789', 'Non-Member', '2023-01-05'),
    ('CUS0000006', 'Frank', 'Franklin', 'frank@gmail.com', '011-678-9012', 'Member', '2023-01-06'),
    ('CUS0000007', 'Grace', 'Gray', 'grace@gmail.com', '014-901-2345', 'Member', '2023-01-07'),
    ('CUS0000008', 'Harry', 'Harrison', 'harry@gmail.com', '019-234-5678', 'Member', '2023-01-08'),
    ('CUS0000009', 'Ivy', 'Irwin', 'ivy@gmail.com', '019-567-8901', 'Non-Member', '2023-01-09'),
    ('CUS0000010', 'Jack', 'Jackson', 'jack@gmail.com', '010-890-1234', 'Member' , '2023-01-10')

-- Time --
CREATE TABLE Time
( 
    time_id CHAR(10) NOT NULL PRIMARY KEY,
    time_clock CHAR(5) NOT NULL,
    time_year CHAR(4) NOT NULL,
    time_quarter INT NOT NULL CHECK (time_quarter BETWEEN 1 AND 4),
    time_month INT NOT NULL CHECK (time_month BETWEEN 1 AND 12),
    time_day INT NOT NULL CHECK (time_day BETWEEN 1 AND 31),
    CHECK (time_quarter = 1 AND time_month BETWEEN 1 AND 3 OR
           time_quarter = 2 AND time_month BETWEEN 4 AND 6 OR
           time_quarter = 3 AND time_month BETWEEN 7 AND 9 OR
           time_quarter = 4 AND time_month BETWEEN 10 AND 12)
);



INSERT INTO Time (time_id, time_clock, time_year, time_quarter, time_month, time_day)
VALUES
    ('TIM0000001', '09:00', '2023' , '4' , '12', '01'),
    ('TIM0000002', '10:30', '2023' , '4' , '12', '02'),
    ('TIM0000003', '11:00', '2023' , '4' , '12', '03'),
    ('TIM0000004', '15:30', '2023' , '4' , '12', '04'),
    ('TIM0000005', '14:30', '2023' , '4' , '12', '05'),
    ('TIM0000006', '15:00', '2023' , '4' , '12', '06'),
    ('TIM0000007', '10:15', '2023' , '4' , '12', '07'),
    ('TIM0000008', '14:40', '2023' , '4' , '12', '08'),
    ('TIM0000009', '08:10', '2023' , '4' , '12', '09'),
    ('TIM0000010', '19:00', '2023' , '4' , '12', '10')




-- Promotion --
CREATE TABLE Promotion
( 
	promotion_id char(10) NOT NULL PRIMARY KEY,
	promotion_name varchar(50) NOT NULL,
	description varchar(100),
	start_date date,
	end_date date,
	discount decimal(3,2)
);


INSERT INTO Promotion (promotion_id, promotion_name, description, start_date, end_date, discount)
VALUES
 	('PRM0000000','NoPromotion', NULL,NULL,NULL, 0.00),
    ('PRM0000001', 'CNY', 'Chinese New Year!', '2023-03-01', '2023-03-31', 0.15),
    ('PRM0000002', 'BlackFriday', 'Black Friday', '2023-04-01', '2023-04-30', 0.20),
    ('PRM0000003', 'BackToSchool', 'Special discounts on back-to-school essentials.', '2023-05-01', '2023-05-30', 0.10),
    ('PRM0000004', 'FallFest', 'Celebrate fall with exclusive discounts', '2023-06-15', '2023-07-15', 0.18),
    ('PRM0000005', 'SpringSale', 'Enjoy spring with special discounts!', '2023-08-01', '2023-08-30', 0.12),
    ('PRM0000006', 'SummerSplash', 'Cool off with summer savings!', '2023-09-01', '2023-09-30', 0.15),
    ('PRM0000007', 'HolidayJoy', 'Spread holiday cheer with exclusive promotions.', '2023-10-01', '2023-10-31', 0.25),
    ('PRM0000008', 'TechFrenzy', 'Unleash the tech enthusiast in you with amazing tech deals.', '2023-11-01', '2023-11-30', 0.18),
    ('PRM0000009', 'WinterWarmth', 'Stay cozy this winter with special discounts on winter essentials.', '2023-12-01', '2023-12-31', 0.20);

-- Movie --
CREATE TABLE Movie
( 
	movie_id char(10) NOT NULL PRIMARY KEY,
	movie_title varchar(50) NOT NULL,
	movie_language varchar(15) NOT NULL,
	release_date date NOT NULL,
	duration_minute int NOT NULL
);

INSERT INTO Movie (movie_id,  movie_title, movie_language, release_date, duration_minute) VALUES 
    ('MOV0000001', 'War On Terror : KL Anarki', 'Malay', '2023-11-23', 100),
    ('MOV0000002', 'Wakaf', 'Indo', '2023-12-07', 99),
    ('MOV0000003', 'Wish', 'English', '2023-11-23', 94),
    ('MOV0000004', 'Trending Topic', 'Mandarin', '2023-12-7', 122),
    ('MOV0000005', 'Magik', 'Malay', '2023-11-30', 113),
    ('MOV0000006', 'Hi Nanna', 'Tamil', '2023-12-7', 142),
    ('MOV0000007', 'Cobweb', 'Korean', '2023-11-16', 133),
    ('MOV0000008', 'Silent Night', 'English', '2023-11-30', 104),
    ('MOV0000009', 'Gampang Cuan', 'Indo', '2023-12-07', 119),
    ('MOV0000010', 'The Marvels', 'English', '2023-11-09', 105)

-- Cinema --
CREATE TABLE Cinema
(
	cinema_id char(10) NOT NULL PRIMARY KEY,
	location_address varchar(100) NOT NULL,
	location_city varchar(50) NOT NULL,
	location_state varchar(50) NOT NULL,
	location_postcode char(5) NOT NULL,
	location_name varchar(50) NOT NULL
);

INSERT INTO Cinema (cinema_id, location_address, location_city, location_state, location_postcode, location_name) VALUES
    ('CIN0000001', 'L3-AT5, 2nd Floor, IOI City Mall', 'Putrajaya', 'Selangor', '62502', 'GSC IOI City Mall'),
    ('CIN0000002', '3RD FLOOR, Lot T-001 Mid Valley Megamall, Lingkaran Syed Putra, Mid Valley City', 'Kuala Lumpur', 'Federal Territory of Kuala Lumpur', '59200', 'GSC Cinema Mid Valley Megamall'),
    ('CIN0000003', 'Lot L5.14, Level 5 Nu Sentral, 201, Jalan Tun Sambanthan', 'Kuala Lumpur', 'Federal Territory of Kuala Lumpur', '50470', 'GSC NU Sentral'),
    ('CIN0000004', 'Lot S 29A & S, 30, Floor 2, Jln Taman Ibu Kota, Danau Kota', 'Kuala Lumpur', 'Federal Territory of Kuala Lumpur', '53300', 'GSC Setapak Central'),
    ('CIN0000005', 'Lot F30, 32 & 33A, Subang Parade, 5, Jalan SS 16/1, Ss 16', 'Subang Jaya', 'Selangor', '47500', 'GSC Subang Parade'),
    ('CIN0000006', 'T-01, Level 2A, EkoCheras Mall No 693, Batu, 5, Jln Cheras', 'Kuala Lumpur', 'Federal Territory of Kuala Lumpur', '56000', 'GSC EkoCheras Mall'),
    ('CIN0000007', 'MyTOWN Shopping Centre, Level 3A & 3B, Seksyen 90, L3-AT-002, Jalan Cochrane, Maluri', 'Kuala Lumpur', 'Federal Territory of Kuala Lumpur', '55100', 'GSC MyTown'),
    ('CIN0000008', 'G3-18, Level G3, Jln Lingkaran Tengah 2, KL Timur', 'Kuala Lumpur', 'Federal Territory of Kuala Lumpur', '53100', 'GSC KL East Mall'),
    ('CIN0000009', 'The Summit Subang, Level 3 & 5, Persiaran Kewajipan, Usj 1', 'Subang Jaya', 'Selangor', '47600', 'GSC Summit USJ'),
    ('CIN0000010', '3rd Floor, Tropicana Gardens Mall, No2A, Persiaran Surian, Tropicana Indah', 'Petaling Jaya', 'Selangor', '47810', 'GSC Tropicana Gardens Mall');
   
-- Hall --
CREATE TABLE Hall
( 
	hall_id char(10) NOT NULL PRIMARY KEY,
	cinema_id char(10) NOT NULL,
	hall_number int NOT NULL,
	experience varchar(20) NOT NULL,
	is_full char(1) NOT NULL,
	FOREIGN KEY (cinema_id) REFERENCES Cinema(cinema_id)
	
);

INSERT INTO Hall (hall_id, cinema_id, hall_number, experience, is_full)
VALUES
    ('HLL0000001', 'CIN0000001',  5, 'Standard', 0),
    ('HLL0000002', 'CIN0000002',  9, 'IMAX', 0),
    ('HLL0000003', 'CIN0000003',  1, 'Standard', 0),
    ('HLL0000004', 'CIN0000004',  3, 'Dolby Atmos', 0),
    ('HLL0000005', 'CIN0000005',  6, '4DX', 0),
    ('HLL0000006', 'CIN0000006',  2, 'Standard', 0),
    ('HLL0000007', 'CIN0000007',  4, 'IMAX', 0),
    ('HLL0000008', 'CIN0000008',  8, 'Dolby Atmos', 0),
    ('HLL0000009', 'CIN0000009',  7, 'Standard', 0),
    ('HLL0000010', 'CIN0000010',  10, '4DX', 0);



 -- Showtime --
CREATE TABLE Showtime
( 
	showtime_id char(10) NOT NULL PRIMARY KEY,
	movie_id char(10) NOT NULL,
	hall_id char(10) NOT NULL,
	start_time char(5) NOT NULL,
	end_time char(5) NOT NULL,
	showtime_date date NOT NULL,
	showtime_price decimal(5,2) NOT NULL,
	FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
	FOREIGN KEY (hall_id) REFERENCES Hall(hall_id)
);

INSERT INTO Showtime (showtime_id, movie_id, hall_id, start_time, end_time, showtime_date, showtime_price)
VALUES
    ('ST0000001', 'MOV0000001', 'HLL0000001', '14:00', '16:28', '2023-02-01', 24.00),
    ('ST0000002', 'MOV0000003', 'HLL0000002', '18:30', '20:42', '2023-03-01', 24.00),
    ('ST0000003', 'MOV0000004', 'HLL0000002', '12:15', '14:20', '2023-04-01', 18.00),
    ('ST0000004', 'MOV0000002', 'HLL0000001', '16:45', '18:53', '2023-05-04', 15.00),
    ('ST0000005', 'MOV0000005', 'HLL0000003', '15:45', '18:18', '2023-06-15', 20.00),
    ('ST0000006', 'MOV0000007', 'HLL0000004', '20:00', '22:13', '2023-08-06', 22.00),
    ('ST0000007', 'MOV0000009', 'HLL0000005', '14:30', '16:49', '2023-09-07', 18.00),
    ('ST0000008', 'MOV0000010', 'HLL0000006', '17:15', '19:30', '2023-10-08', 25.00),
    ('ST0000009', 'MOV0000006', 'HLL0000007', '12:45', '15:17', '2023-11-09', 18.50),
    ('ST0000010', 'MOV0000008', 'HLL0000008', '19:30', '21:34', '2023-12-12', 23.50);


   
-- Fact --
CREATE TABLE Fact_TicketSales (
   showtime_id CHAR(10) NOT NULL,
   promotion_id CHAR(10) NOT NULL,
   cust_id CHAR(10) NOT NULL,
   time_id CHAR(10) NOT NULL,
   payment_id CHAR(10) NOT NULL,
   ticket_count INT NOT NULL,
   seat_number VARCHAR(3) NOT NULL,
   sale_amount DECIMAL(5,2) NOT NULL DEFAULT 00.00,
   PRIMARY KEY (showtime_id, promotion_id, cust_id, time_id, payment_id),
   FOREIGN KEY (showtime_id) REFERENCES Showtime(showtime_id),
   FOREIGN KEY (promotion_id) REFERENCES Promotion(promotion_id),
 	FOREIGN KEY (cust_id) REFERENCES Customer(cust_id),
   FOREIGN KEY (time_id) REFERENCES Time(time_id),
   FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)
);


INSERT INTO Fact_TicketSales (showtime_id, promotion_id, cust_id, time_id, payment_id, ticket_count, seat_number, sale_amount) 
VALUES
    ('ST0000001', 'PRM0000000', 'CUS0000001', 'TIM0000001', 'PAY0000001', 1, 'G12', DEFAULT),
    ('ST0000002', 'PRM0000001', 'CUS0000002', 'TIM0000002', 'PAY0000002', 3, 'E09', DEFAULT),
    ('ST0000003', 'PRM0000002', 'CUS0000003', 'TIM0000003', 'PAY0000003', 4, 'I04', DEFAULT),
    ('ST0000004', 'PRM0000003', 'CUS0000004', 'TIM0000004', 'PAY0000003', 2, 'F02', DEFAULT),
    ('ST0000005', 'PRM0000004', 'CUS0000010', 'TIM0000005', 'PAY0000004', 2, 'A03', DEFAULT),
    ('ST0000006', 'PRM0000005', 'CUS0000005', 'TIM0000006', 'PAY0000005', 3, 'B08', DEFAULT),
    ('ST0000007', 'PRM0000006', 'CUS0000006', 'TIM0000007', 'PAY0000006', 1, 'C12', DEFAULT),
    ('ST0000008', 'PRM0000007', 'CUS0000007', 'TIM0000008', 'PAY0000007', 4, 'D05', DEFAULT),
    ('ST0000009', 'PRM0000008', 'CUS0000008', 'TIM0000009', 'PAY0000008', 2, 'E09', DEFAULT),
    ('ST0000010', 'PRM0000009', 'CUS0000009', 'TIM0000010', 'PAY0000009', 3, 'F14', DEFAULT);
 
CREATE TRIGGER update_sale_amount
AFTER INSERT ON Fact_TicketSales
REFERENCING NEW AS N
FOR EACH ROW MODE DB2SQL

BEGIN
    DECLARE showtime_price DECIMAL(5, 2);
    DECLARE promotion_discount DECIMAL(3,2);
    DECLARE payment_status VARCHAR(20);

    -- Get the showtime_price from the Showtime table
    SELECT s.showtime_price
    INTO showtime_price
    FROM Showtime s
    WHERE s.showtime_id = N.showtime_id;

    -- Get the promotion_discount from the Promotion table
    SELECT p.discount
    INTO promotion_discount
    FROM Promotion p
    WHERE p.promotion_id = N.promotion_id;
   
   -- Get payment status from the Payment table 
   SELECT py.payment_status 
   INTO payment_status
   FROM Payment py 
   WHERE py.payment_id = N.payment_id;

    -- Update the sale_amount in the Fact_TicketSales table
    UPDATE Fact_TicketSales
    SET sale_amount =
        CASE 
            WHEN payment_status = 'Completed' THEN showtime_price * N.ticket_count * (1 - promotion_discount)
            WHEN payment_status = 'Pending' THEN 0.00
        END
    WHERE showtime_id = N.showtime_id
        AND promotion_id = N.promotion_id
        AND payment_id = N.payment_id;
END;


INSERT INTO Fact_TicketSales (showtime_id, promotion_id, cust_id, time_id, payment_id, ticket_count, seat_number, sale_amount) 
VALUES
    ('ST0000005', 'PRM0000009', 'CUS0000002', 'TIM0000001', 'PAY0000005', 1, 'I04', DEFAULT)

SELECT * FROM FACT_TICKETSALES 
SELECT * FROM Showtime  
--DELETE FROM Fact_TicketSales 
--WHERE showtime_id = 'ST0000005'

--DROP TRIGGER update_sale_amount 




