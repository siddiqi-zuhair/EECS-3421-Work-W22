CREATE DATABASE Assignment1Zuhair;
Go
--Create table for car, all values except for the primary key car_id can be null
CREATE TABLE car (
  [car_id] int NOT NULL,
  [serial_number] int DEFAULT NULL,
  [make] varchar(45) DEFAULT NULL,
  [model] varchar(45) DEFAULT NULL,
  [color] varchar(45) DEFAULT NULL,
  [year] int DEFAULT NULL,
  [car_for_sale] smallint DEFAULT NULL,
  PRIMARY KEY ([car_id])
)  ;
--Insert values into car, randomized values with the primary key incrementing by 1 starting at 211 
INSERT INTO car VALUES (211,54878,'Honda','Civic','Red',2016,1),(212,20898,'Nissan','Altima','Black',2019,1),(213,5869,'Toyota','Corolla','Blue',2021,0),(214,98216,'Chevrolet','Camaro','Red',2016,0),(215,93097,'Ford','Focus','White',2017,1),(216,22457,'Ford','F-150','Purple',2018,1);

--Repeat creation process using table for all tables requested, adding relevant primary and foreign keys 

CREATE TABLE salesperson (
  [salesperson_id] int NOT NULL,
  [first_name] varchar(45) DEFAULT NULL,
  [last_name] varchar(45) DEFAULT NULL,
  PRIMARY KEY ([salesperson_id])
)  ;

INSERT INTO salesperson VALUES (511,'Steve','Rogers'),(512,'Joseph','Ma'),(513,'Thomas','Innit'),(514,'Robert','Munsch'),(515,'Karl','Jacobs'),(516,'Ralph','Thomas');
CREATE TABLE customer (
  [customer_id] int NOT NULL,
  [last_name] varchar(45) DEFAULT NULL,
  [first_name] varchar(45) DEFAULT NULL,
  [phone_number] varchar(10) DEFAULT NULL,
  [address] varchar(45) DEFAULT NULL,
  [city] varchar(45) DEFAULT NULL,
  [province] varchar(45) DEFAULT NULL,
  [country] varchar(45) DEFAULT NULL,
  [post_code] varchar(6) DEFAULT NULL,
  PRIMARY KEY ([customer_id])
)  ;



INSERT INTO customer VALUES (111,'Crofte','Ferne','2691214586','123 Sesame Street','Markham','Ontario','Canada','L3R1P2'),(112,'Bowes','Yosef','6472149201','142 Joe Street','Barrie','Ontario','Canada','M4P3T1'),(113,'Smith','John','4167219243','1868 Ross Street','Smith Falls','Ontario','Canada','K7A4Z9'),(114,'Doe','Jane','2264210333','2151 Lyons Avenue','Brantford','Ontario','Canada','K7A5T3'),(115,'Tank','Thomas','1843921292','4512 Haaglund Rd','Vancouver','British Columbia','Canada','L4M3B1'),(116,'Specter','Mark','7028076272','2927 137th Avenue','Edmonton','Alberta','Canada','M3B2W6');

CREATE TABLE mechanic (
  [mechanic_id] int NOT NULL,
  [last_name] varchar(45) DEFAULT NULL,
  [first_name] varchar(45) DEFAULT NULL,
  PRIMARY KEY ([mechanic_id])
)  ;

INSERT INTO mechanic VALUES (311,'Arroyo','Matteo'),(312,'Xu','Jonathan'),(313,'Thomas','Warren'),(314,'Wickens','Jayce'),(315,'Mill','Mya'),(316,'Day','Lily');

CREATE TABLE service (
  [service_id] int NOT NULL,
  [service_name] varchar(45) DEFAULT NULL,
  [hourly_rate] int DEFAULT NULL,
  PRIMARY KEY ([service_id])
)  ;

INSERT INTO service VALUES (611,'Tire Rotation',5),(612,'Engine Change',20),(613,'Wiper Refuel',15),(614,'Oil Refill',12),(615,'Window Repair',13),(616,'Paint Removal',3);


CREATE TABLE parts (
  [parts_id] int NOT NULL,
  [part_number] int DEFAULT NULL,
  [description] varchar(45) DEFAULT NULL,
  [purchase_price] int DEFAULT NULL,
  [retail_price] int DEFAULT NULL,
  PRIMARY KEY ([parts_id])
)  ;

INSERT INTO parts VALUES (411,324,'Wheel',300,500),(412,521,'Nut',5,10),(413,831,'Bolt',2,4),(414,228,'Tire',100,200),(415,439,'Engine',1000,2000),(416,664,'Radio',200,400);

-- Put constraints on foreign keys to ensure that non-valid primary keys can be used as foreign keys
CREATE TABLE sales_invoice (
  [invoice_id] int NOT NULL,
  [invoice_number] int NOT NULL,
  [date] date DEFAULT NULL,
  [car_id] int NOT NULL,
  [customer_id] int NOT NULL,
  [salesperson_id] int NOT NULL,
  PRIMARY KEY ([invoice_id])
 ,
  CONSTRAINT [sales_invoice_ibfk_1] FOREIGN KEY ([car_id]) REFERENCES car ([car_id]),
  CONSTRAINT [sales_invoice_ibfk_2] FOREIGN KEY ([customer_id]) REFERENCES customer ([customer_id]),
  CONSTRAINT [sales_invoice_ibfk_3] FOREIGN KEY ([salesperson_id]) REFERENCES salesperson ([salesperson_id])
)  ;



INSERT INTO sales_invoice VALUES (711,1,'2021-02-01',212,114,514),(712,2,'2022-01-01',216,113,512),(713,3,'2019-05-04',213,111,513),(714,4,'2017-06-09',214,115,511),(715,5,'2014-09-10',215,116,515),(716,6,'2018-01-01',211,112,516);

CREATE TABLE service_ticket (
  [service_ticket_id] int NOT NULL,
  [service_ticket_number] int NOT NULL,
  [car_id] int NOT NULL,
  [customer_id] int NOT NULL,
  [date_received] date DEFAULT NULL,
  [comments] varchar(50) DEFAULT NULL,
  [date_returned_to_customer] date DEFAULT NULL,
  PRIMARY KEY ([service_ticket_id])
 ,
  CONSTRAINT [service_ticket_ibfk_1] FOREIGN KEY ([car_id]) REFERENCES car ([car_id]),
  CONSTRAINT [service_ticket_ibfk_2] FOREIGN KEY ([customer_id]) REFERENCES customer ([customer_id])
)  ;



INSERT INTO service_ticket VALUES (811,1,212,114,'2021-09-01','N/A','2021-09-08'),(812,2,213,111,'2020-03-11','N/A','2020-03-15'),(813,3,216,113,'2019-03-11','N/A','2019-03-19'),(814,4,215,116,'2018-11-12','N/A','2018-12-01'),(815,5,211,112,'2016-10-11','N/A','2016-10-17'),(816,6,214,115,'2017-05-07','N/A','2017-05-12');

CREATE TABLE parts_used ( 
  [parts_used_id] int NOT NULL,
  [parts_id] int NOT NULL,
  [service_ticket_id] int NOT NULL,
  [number_used] varchar(45) DEFAULT NULL,
  [price] int DEFAULT NULL,
  PRIMARY KEY ([parts_used_id]),
  CONSTRAINT [parts_used_ibfk_1] FOREIGN KEY ([parts_id]) REFERENCES parts ([parts_id]),
  CONSTRAINT [parts_used_ibfk_2] FOREIGN KEY ([service_ticket_id]) REFERENCES service_ticket ([service_ticket_id])
)  ;


INSERT INTO parts_used VALUES (1011,414,816,2,400),(1012,411,814,5,2500),(1013,415,812,3,6000),(1014,416,813,4,1600),(1015,412,811,5,50),(1016,413,815,1,4);


CREATE TABLE service_mechanic (
  [servicemechanic_id] int NOT NULL,
  [service_ticket_id] int NOT NULL,
  [service_id] int NOT NULL,
  [mechanic_id] int NOT NULL,
  [hours] int NOT NULL,
  [comment] varchar(50) DEFAULT NULL,
  [rate] int NOT NULL,
  PRIMARY KEY ([servicemechanic_id])
 ,
  CONSTRAINT [service_mechanic_ibfk_1] FOREIGN KEY ([service_ticket_id]) REFERENCES service_ticket ([service_ticket_id]),
  CONSTRAINT [service_mechanic_ibfk_2] FOREIGN KEY ([service_id]) REFERENCES service ([service_id]),
  CONSTRAINT [service_mechanic_ibfk_3] FOREIGN KEY ([mechanic_id]) REFERENCES mechanic ([mechanic_id])
)  ;


INSERT INTO service_mechanic VALUES (911,811,613,315,2,'N/A',30),(912,815,612,311,1,'N/A',20),(913,813,616,312,3,'N/A',9),(914,812,615,313,2,'N/A',26),(915,814,614,314,6,'N/A',72),(916,816,611,316,4,'N/A',20);