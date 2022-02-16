--Create view from sales_invoice since this is the only table with the car_id and salesperson_id to allow for the joining of both 
CREATE VIEW CarView
AS
SELECT invoice_number, date, serial_number, make, model, color, year, CONCAT(first_name, ' ', last_name) AS Seller_Name
FROM sales_invoice 
JOIN car 
ON car.car_id = sales_invoice.car_id
JOIN salesperson 
ON salesperson.salesperson_id = sales_invoice.salesperson_id
;