/* ASH HARBIN
17652530
*/

-- Removes and creates a blank database called PSAS to prevent possible errors down the line
-- Then tells PHPMyAdmin to use this database for the following code
DROP DATABASE IF EXISTS dbs364085;
CREATE DATABASE dbs364085;
USE dbs364085;

--  Creates Table and Columns for storing Student key and ID number.
CREATE TABLE student(
stud_key INT(4) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
stud_idno INT(8) UNSIGNED NOT NULL UNIQUE, -- Needs to be unique and prevent replicated ids
stud_activ BOOL NOT NULL DEFAULT FALSE, -- checks whether or not student email activated
stud_prog BOOL NOT NULL, -- Comp Sci if 0 or FALSE, Games Comp if 1 or TRUE, can use this for additional modules in module table for course selection when copying.
stud_acadass_rndwght INT(4) UNSIGNED, -- set default to 0 meaning 0 academic, make constraint/foreign key of academic table
stud_acadass_bestfit INT(4) UNSIGNED -- set default to 0 meaning 0 academic, make constraint/foreign key of academic table
);

-- Creates Table and Columns for storing Student login details
CREATE TABLE student_auth{
stud_key INT(4) UNSIGNED NOT NULL -- make foreign key of STUDENT stud_key
-- salt
-- hash
}

-- Creates Table and Columns for storing Student module affinities
CREATE TABLE student_mods{
stud_key INT(4) UNSIGNED NOT NULL -- modify this to be foreign key of STUDENT stud_key
-- use either programmes or the ACM Computing Classification Systems to determine columns for this
}

-- Creates Table and Single for storing Staff Details. Other Columns added using an ALTER TABLE statement further down. (Demonstrates Task 1.1iii)
CREATE TABLE academic(
acad_id INT(4) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(15) NOT NULL,
last_name VARCHAR(15) NOT NULL,
-- as with STUDENT_MODS, use either programme modules or ACM Computing Classification System
acad_studsup_rndwght INT (1) UNSIGNED NOT NULL -- set default to zero, number of students assigned to this supervisor. Count match STUDENT stud_acadass 
acad_studsup_bestfit INT (1) UNSIGNED NOT NULL -- set default to zero, number of students assigned to this supervisor. Count match STUDENT stud_acadass 
);

-- See if can create table for storing modules, and insert into students and academics as when. Reduces code complexity. Simple copy-paste.
-- May need to split further into programme sections, since modules may vary. Will need to set this up
-- Use 0, 1, 2 for programme. If 0 CompSci, if 1 Games Comp, if 2 both. When student setup, insert modules matching 0 and 2 or 1 and 2. This could be linked to a function for when student initialises, or if they need to update because wrong module.
INSERT INTO student
SELECT * FROM modules
INSERT INTO academic
SELECT * FROM modules


-- BEST FIT TABLES --
-- Once student has assigned affinity, function to create new table called 
/* STUDENT_#stud_key(
-- For each academic in ACADEMIC:
  -- new row: acad_ID as foreign key, fill columns with calculated difference.
  -- final column being affinity / sum of difference: absolute value.
);  */

/* Function selects either best fit academic or, best five or best fit + all academics < certain variance and select random, as long as academics have room for students within */


-- Begin Altering tables to add Columns, Constraints and Foreign Keys. Demonstrates Column Modify and Add. (1.1 iii)
ALTER TABLE student
DROP PRIMARY KEY,
ADD FOREIGN KEY (stock_id) REFERENCES stock(stock_id) ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY (staff_id) REFERENCES staff(staff_id) ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY (service_id) REFERENCES services(service_id) ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY (status_id) REFERENCES order_status_code(status_id) ON DELETE CASCADE ON UPDATE CASCADE,
ADD PRIMARY KEY (`order_id`, `stock_id`) USING BTREE;

ALTER TABLE student_auth
DROP PRIMARY KEY,
ADD FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id) ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY (stock_id) REFERENCES stock(stock_id) ON DELETE CASCADE ON UPDATE CASCADE,
ADD PRIMARY KEY (`purchase_order_id`, `stock_id`) USING BTREE;

ALTER TABLE student_mods

ALTER TABLE academic
MODIFY COLUMN acad_id INT(5) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
ADD FOREIGN KEY (acad_studsup) REFERENCES student(stud_key) ON DELETE CASCADE ON UPDATE CASCADE;


-- Tables altered


-- Data Manipulation (1.2 i)
-- Set Default
ALTER TABLE stock
ALTER stock_description SET DEFAULT 'Item Description';

/*
-- Begin inserting data
-- Populates Customer table with data
INSERT INTO `customer`(`first_name`, `last_name`,`dob`, `email`, `tel_num`, `address_line1`, `address_line2`, `city`, `county`, `post_code`)
VALUES
('Sample','Person','0000-01-01','sample@person.co.uk','01522 123456','Address Line 1',NULL,'City','County','AB1 2CD'),
('Tom','Dickenharry','1973-03-21','dickenharry@lincolnmail.co.uk','01522 976431','Appt 10 Lindum House','2060 Comp Street','Lincoln','LINCOLNSHIRE','LN1 0BN'),
('Babs','Chargeable','1999-08-08','babsiebaby@mail.net','01522 248631','45 Copmuting Street',NULL,'Sleaford','LINCOLNSHIRE','NG34 9FF'),
('Alain','Grunt','1988-11-26','agrunt@mail.net','01522 134679','54 Adasbeta Road',NULL,'Grantham','LINCOLNSHIRE','NG31 9AB'),
('Antoine','Caws','1997-10-10','antoinecaws@person.co.uk','01427 172839','8 Actshollo',NULL,'Grantham','LINCOLNSHIRE','NG31 1NO');

-- Populates Departments table with data
INSERT INTO `departments`(`department_name`)
VALUES
('Administration'),
('Human Resources'),
('Sales and Marketing'),
('Technical'),
('IT Services');

-- Populates Staff table with data. Sets ID to default as auto_increment
INSERT INTO `staff`(`first_name`, `last_name`,`dob`, `email`, `tel_num`, `job_title`, `department_id`, `address_line1`, `address_line2`, `city`, `county`, `post_code`)
VALUES
('Ash','Harbin','1991-10-08','17652530@students.lincoln.ac.uk','07770 0101111','Database Adminstrator',5,'123 Cascade Street',NULL,'Lincoln','LINCOLNSHIRE','LN1 1NO'),
('Adel','Alecova','1993-06-12','aalecova@lcs.co.uk','01522 987654','Repair Technician',4,'8 Carholme Road',NULL,'Lincoln','LINCOLNSHIRE','LN8 3NO'),
('Abel','Gilts','1990-04-11','agilts@lcs.co.uk','01522 153759','Repair Technician',4,'32 Some Avenue','Ermine East','Lincoln','LINCOLNSHIRE','LN2 3FF'),
('Eve','Jobsst','1993-06-12','ejobsst@lcs.co.uk','01522 741963','CEO',1,'13 Bleat Road',NULL,'Gainsborough','LINCOLNSHIRE','DN21 3BE'),
('Bernie','Smelter','1998-06-12','bsmelter@lcs.co.uk','01522 987654','Sales Assistant',3,'44 Monks Road',NULL,'Lincoln','LINCOLNSHIRE','LN6 1EF'),
('Aaron','Eric-Protocol','2000-07-22','aeric-protocol@lcs.co.uk','01522 555973','Payroll Administrator',2,'36 Cross Street',NULL,'Lincoln','LINCOLNSHIRE','LN4 3FG');

INSERT INTO `suppliers`(`supplier_name`, `email`, `tel_num`, `address_line1`, `address_line2`, `city`, `county`, `post_code`)
VALUES
('Lincoln Hardware Solutions Ltd.','sales@lincolnhardwaresolutions.co.uk','01522 303030','Unit 5 Escuel Way','Made Up Industrial Estate','Lincoln','LINCOLNSHIRE','LN3 5DB'),
('Technet Computing','orders@technetcomputin.biz.uk','01302 908070','8 Random Road','Balby','Doncaster','South Yorkshire','DN4 9EE');

-- Populates Order Status Codes table with data. Sets ID to default as auto_increment
INSERT INTO `order_status_code`(`status_detail`)
VALUES
('Raised'),
('Assigned'),
('Quoted'),
('In Progress'),
('Completed'),
('Cancelled');

-- Populates Services table with data. Sets ID to default as auto_increment
INSERT INTO `services`(`service_name`)
VALUES
('Upgrade'),
('Hardware Fault Repair'),
('Software'),
('Networking'),
('Internet'),
('Training'),
('Backup'),
('Antivirus'),
('Maintenance');

-- Populates Stock table with data. Sets ID to default as auto_increment
INSERT INTO `stock`(`stock_name`, `stock_description`, `stock_ean`, `stock_quantity`, `stock_location`, `item_price`) 
VALUES
('Super Fast Processor','This is a processor. I am not typing out a huge description for this.','09876543210',13,'A133B',999.99),
('Excellent Motherboard', 'This is a motherboard. I am not typing out a huge description for this.','01234567890',9,'A135A',249.99),
('Fast Processor','This is a processor. I am not typing out a huge description for this.','09182736450',5,'A135B',399.99),
('Quick Processor','This is a processor. I am not typing out a huge description for this.','01958763250',3,'B229A',199.99),
('Slow Processor','This is a processor. I am not typing out a huge description for this.','06578098700',5,'B023B',79.99),
('Decent Motherboard','This is a motherboard. I am not typing out a huge description for this.','02213326540',9,'C019B',104.99),
('Alright Motherboard','This is a motherboard. I am not typing out a huge description for this.','01365247410',12,'B035B',78.49),
('Computer Case','This is a computer case. I am not typing out a huge description for this.','05546345150',6,'A134B',399.99),
('Power Supply','This is a  power supply. I am not typing out a huge description for this.','09182666310',15,'A001A',99.99);

-- Populates Customer Orders table with data.
INSERT INTO `customer_orders` (`order_id`,`customer_id`, `staff_id`, `service_id`, `stock_id`, `quantity_requested`, `status_id`, `location_at_lcs`, `order_datetime`)
VALUES
('1', '1', '2', '1', '1', '2', '4', '0', '2019-12-01 11:54:02'),
('1', '1', '2', '1', '2', '2', '4', '0', '2019-12-01 11:54:02'),
('2', '2', '3', '1', '3', '1', '3', '1', CURRENT_TIMESTAMP),
('3', '4', '5', '5', '3', '1', '1', '0', CURRENT_TIMESTAMP);

-- Populates Purchase Order for a product
INSERT INTO `purchase_order` (`purchase_order_id`, `supplier_id`, `stock_id`, `quantity_req`)
VALUES
('1', '1', '1', '1');

-- Demonstrates Delete of a Supplier, cascades to Foreign Key to preserve constraint integrity
-- When this Supplier is deteled, so too is the corresponding data entry in the Suppliers_address table
DELETE FROM `suppliers` WHERE supplier_id = 2;

-- Demonstrates Update of a Table Value, cascade is set
UPDATE `customer` SET `first_name`='Greg',`last_name`='Oboeole',`dob`='1988-04-13',`email`='oboeole@email.co.uk', `address_line1`='1 New Street',`address_line2`=NULL,`city`='Lincoln',`county`='LINCOLNSHIRE',`post_code`='LN1 1AA' WHERE customer_id = 1;

-- Joins (1.2 ii)
-- Inner Join.
-- Query Customer Orders against current Stock levels, on items with fewer than 10 in stock.
SELECT customer_orders.order_id, stock.stock_id, stock.stock_name, stock.stock_quantity, customer_orders.quantity_requested
FROM customer_orders
INNER JOIN
stock ON customer_orders.stock_id = stock.stock_id
WHERE stock.stock_quantity < 10;

-- Left Join. 
-- Find all Technical Department Staff that are currently assigned to an order, filtering out duplicate results
SELECT staff.staff_id, staff.department_id, staff.first_name, staff.last_name, customer_orders.order_id
FROM customer_orders
LEFT JOIN staff ON customer_orders.staff_id = staff.staff_id
WHERE staff.department_id = 4
GROUP BY staff_id, order_id
ORDER BY customer_orders.order_id;

-- Right Join.
-- Find and selects all Staff that are not in the Sales and Marketing or Technical Departments
SELECT departments.department_id, departments.department_name, staff.staff_id, staff.first_name, staff.last_name, staff.job_title
FROM departments
RIGHT JOIN staff ON staff.department_id = departments.department_id
WHERE NOT departments.department_id = 3
AND NOT departments.department_id = 4
ORDER BY departments.department_id;

-- Union (1.2 iii)
-- Select all people currently in the database that reside in Lincoln
SELECT customer_id, first_name, last_name, email, tel_num, city FROM customer
WHERE city = 'Lincoln'
UNION ALL
SELECT staff_id, first_name, last_name, email, tel_num, city FROM staff
WHERE city = 'Lincoln';


-- Copy Creation (1.2 iv)
CREATE TABLE copy_of_customer LIKE customer;
INSERT copy_of_customer SELECT * FROM customer;

CREATE TABLE copy_of_staff LIKE staff;
INSERT copy_of_staff SELECT * FROM staff;

CREATE TABLE copy_of_departments LIKE departments;
INSERT copy_of_departments SELECT * FROM departments;

CREATE TABLE copy_of_stock LIKE stock;
INSERT copy_of_stock SELECT * FROM stock;

CREATE TABLE copy_of_services LIKE services;
INSERT copy_of_services SELECT * FROM services;

CREATE TABLE copy_of_order_status_code LIKE order_status_code;
INSERT copy_of_order_status_code SELECT * FROM order_status_code;

CREATE TABLE copy_of_customer_orders LIKE customer_orders;
INSERT copy_of_customer_orders SELECT * FROM customer_orders;

CREATE TABLE copy_of_suppliers LIKE suppliers;
INSERT copy_of_suppliers SELECT * FROM suppliers;

CREATE TABLE copy_of_purchase_order LIKE purchase_order;
INSERT copy_of_purchase_order SELECT * FROM purchase_order;


-- User Permission (1.2 v)
-- User has Read-Only Permissions 
CREATE USER IF NOT EXISTS 'new_user_lcs17652530'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, CREATE VIEW, SHOW VIEW ON lcs.* TO 'new_user_lcs17652530'@'localhost';

-- Stored Procedure (1.2 vi)
-- Stored Procedure takes in two variables
-- Where the first variable is the Customer ID
-- The Order Status ID is set to the second variable
-- Where all rows match
-- If Order ID doesn't exist, procedure ignores and ends safely
DELIMITER //
CREATE PROCEDURE updateOrderStatus (IN cID INT(10) UNSIGNED, IN cStatus TINYINT(1) UNSIGNED)
BEGIN
IF EXISTS (SELECT * FROM customer_orders WHERE order_id = cID) AND EXISTS (SELECT * FROM order_status_code WHERE status_id = cStatus) THEN
UPDATE customer_orders SET status_id = cStatus WHERE customer_orders.order_id = cID;
END IF;
END //
DELIMITER ;
*/

-- Database Created Successfully
-- End of SQL file