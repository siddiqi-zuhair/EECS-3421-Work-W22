--insert invalid car_id into sales_invoice to check if constraint on foreign key of car_id works 
INSERT INTO sales_invoice VALUES (717,7,'2018-01-02',217,111,516);

-- insert invalid parts_id into parts_used to check if constraint on foreign key of parts works
INSERT INTO parts_used VALUES (1017,417,815,3,500);

--insert invalid customer_id into service_ticket to check if constraint on foreign key of customer works 
INSERT INTO service_ticket VALUES (817,7,213,117,'2018-01-02','N/A','2018-03-02');