DROP DATABASE IF EXISTS EcommerceSalesDB;
CREATE DATABASE EcommerceSalesDB;
USE EcommerceSalesDB;

CREATE TABLE Categories (
 CategoryID INT PRIMARY KEY,
 CategoryName VARCHAR(100) NOT NULL UNIQUE);
 

CREATE TABLE Products (
 ProductID INT PRIMARY KEY, 
 Name VARCHAR(150) NOT NULL,
 Price DECIMAL(10,2) NOT NULL,
 StockQuantity INT NOT NULL,
 CategoryID INT NOT NULL, 
 FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID));
 
 
CREATE TABLE Customers (
 CustomerID INT PRIMARY KEY,
 Name VARCHAR(100) NOT NULL,
 Email VARCHAR(150) NOT NULL UNIQUE,
 City VARCHAR(80), 
 RegistrationDate DATE);
 
 
CREATE TABLE Orders (
 OrderID INT PRIMARY KEY,
 CustomerID INT NOT NULL, 
 OrderDate DATE NOT NULL,
 OrderStatus VARCHAR(30) NOT NULL,
 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));
 
 
CREATE TABLE OrderDetails (
 DetailID INT PRIMARY KEY,
 OrderID INT NOT NULL,
 ProductID INT NOT NULL,
 Quantity INT NOT NULL,
 UnitPrice DECIMAL(10,2) NOT NULL,
 FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
 FOREIGN KEY (ProductID) REFERENCES Products(ProductID));
 
 
CREATE TABLE Reviews (
 ReviewID INT PRIMARY KEY,
 ProductID INT NOT NULL,
 CustomerID INT NOT NULL,
 Rating INT NOT NULL, 
 Comment VARCHAR(255),
 FOREIGN KEY (ProductID) REFERENCES Products(ProductID), 
 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));
 
 
CREATE TABLE Shipping (
ShippingID INT PRIMARY KEY,
 OrderID INT NOT NULL UNIQUE,
 ShipDate DATE, 
 DeliveryDate DATE,
 ShippingStatus VARCHAR(30),
 FOREIGN KEY (OrderID) REFERENCES Orders(OrderID));
 
 
CREATE TABLE Discounts (
DiscountID INT PRIMARY KEY,
 ProductID INT NOT NULL,
 DiscountAmount DECIMAL(10,2) NOT NULL, 
 FOREIGN KEY (ProductID) REFERENCES Products(ProductID));
 
 
CREATE TABLE Coupons (
CouponID INT PRIMARY KEY,
 CouponCode VARCHAR(30) NOT NULL UNIQUE,
 DiscountAmount DECIMAL(10,2) NOT NULL, 
 MinOrderValue DECIMAL(10,2) NOT NULL,
 ExpiryDate DATE NOT NULL);


INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1,'Electronics'),
(2,'Fashion'),
(3,'Home & Kitchen'),
(4,'Beauty'),
(5,'Sports'),
(6,'Books'),
(7,'Toys'),
(8,'Grocery'),
(9,'Footwear'),
(10,'Accessories');
INSERT INTO Products (ProductID, Name, Price, StockQuantity, CategoryID) VALUES
(1,'Wireless Mouse',1438.97,17,1),
(2,'Mechanical Keyboard',555.32,189,1),
(3,'USB-C Hub',914.90,199,1),
(4,'Bluetooth Speaker',840.37,44,1),
(5,'Smart Watch',1578.54,189,1),
(6,'Power Bank',1492.58,241,1),
(7,'Laptop Stand',1802.48,152,1),
(8,'Webcam',644.39,207,1),
(9,'Noise Cancelling Headphones',1126.16,83,1),
(10,'Portable SSD',562.20,211,1),
(11,'Cotton Shirt',1564.28,179,2),
(12,'Denim Jeans',2337.90,102,2),
(13,'Hoodie',1045.95,43,2),
(14,'Formal Trousers',1510.85,90,2),
(15,'Casual Jacket',2727.87,126,2),
(16,'Kurta',2444.71,55,2),
(17,'Saree',1569.14,131,2),
(18,'Track Pants',2564.31,15,2),
(19,'Summer Dress',3158.36,199,2),
(20,'Rain Jacket',991.88,239,2),
(21,'Air Fryer',5249.09,199,3),
(22,'Mixer Grinder',4764.72,82,3),
(23,'Electric Kettle',3154.86,143,3),
(24,'Non Stick Pan',2323.73,210,3),
(25,'Dinner Set',5930.09,60,3),
(26,'Storage Box',3138.42,144,3),
(27,'Table Lamp',2041.54,248,3),
(28,'Bedsheet Set',2059.40,42,3),
(29,'Water Bottle',5436.55,237,3),
(30,'Vacuum Cleaner',4340.03,175,3),
(31,'Face Wash',2100.73,91,4),
(32,'Moisturizer',1961.55,230,4),
(33,'Shampoo',1613.60,178,4),
(34,'Sunscreen',2399.21,144,4),
(35,'Lip Balm',1330.03,170,4),
(36,'Perfume',1642.03,65,4),
(37,'Hair Dryer',2140.79,54,4),
(38,'Body Lotion',1761.57,110,4),
(39,'Makeup Kit',2198.87,210,4),
(40,'Beard Trimmer',1687.54,56,4),
(41,'Yoga Mat',1149.02,153,5),
(42,'Cricket Bat',438.76,214,5),
(43,'Football',635.07,150,5),
(44,'Badminton Racket',701.37,250,5),
(45,'Skipping Rope',475.38,15,5),
(46,'Gym Gloves',640.35,168,5),
(47,'Resistance Bands',498.25,97,5),
(48,'Tennis Balls',689.06,140,5),
(49,'Sports Cap',1074.74,19,5),
(50,'Cycling Bottle',782.71,43,5),
(51,'Python Basics',1709.91,107,6),
(52,'SQL Fundamentals',1334.22,239,6),
(53,'Data Analytics',1468.60,227,6),
(54,'Web Development',3034.44,221,6),
(55,'Java Programming',2359.59,93,6),
(56,'Excel Guide',2268.62,76,6),
(57,'Database Design',1244.51,29,6),
(58,'Power BI Guide',2549.19,76,6),
(59,'Computer Networks',1226.42,239,6),
(60,'AI for Beginners',1731.59,160,6),
(61,'Building Blocks',4373.62,35,7),
(62,'Remote Car',3241.80,36,7),
(63,'Puzzle Set',2972.86,202,7),
(64,'Board Game',3386.27,139,7),
(65,'Doll House',3898.67,223,7),
(66,'Art Kit',3682.19,32,7),
(67,'Educational Robot',1911.05,209,7),
(68,'Toy Train',1273.30,151,7),
(69,'Action Figure',2190.85,211,7),
(70,'Coloring Book',2036.35,47,7),
(71,'Rice 5kg',719.81,47,8),
(72,'Wheat Flour 5kg',1640.72,183,8),
(73,'Cooking Oil 1L',1557.00,136,8),
(74,'Green Tea',850.28,155,8),
(75,'Coffee Powder',1279.02,57,8),
(76,'Breakfast Cereal',952.13,82,8),
(77,'Pasta Pack',1605.03,150,8),
(78,'Dry Fruits',1031.68,238,8),
(79,'Honey Jar',787.62,170,8),
(80,'Chocolate Box',764.66,123,8),
(81,'Running Shoes',828.57,69,9),
(82,'Casual Sneakers',560.34,153,9),
(83,'Formal Shoes',849.43,208,9),
(84,'Sandals',1130.77,201,9),
(85,'Hiking Shoes',683.09,191,9),
(86,'Flip Flops',521.34,66,9),
(87,'Canvas Shoes',1220.34,197,9),
(88,'Sports Shoes',782.01,94,9),
(89,'Loafers',406.00,117,9),
(90,'Slippers',366.67,186,9),
(91,'Leather Wallet',1693.89,181,10),
(92,'Backpack',3557.03,110,10),
(93,'Travel Bag',4149.41,127,10),
(94,'Sunglasses',2818.37,245,10),
(95,'Watch Strap',1527.94,147,10),
(96,'Key Holder',2672.49,130,10),
(97,'Card Holder',4883.59,45,10),
(98,'Belt',3203.21,78,10),
(99,'Travel Pouch',4793.48,72,10),
(100,'Umbrella',4396.61,31,10);
INSERT INTO Customers (CustomerID, Name, Email, City, RegistrationDate) VALUES
(1,'Ananya Sharma','customer001@example.com','Lucknow','2025-10-29'),
(2,'Nikhil Yadav','customer002@example.com','Mumbai','2025-04-23'),
(3,'Aditya Sharma','customer003@example.com','Pune','2025-04-28'),
(4,'Vivaan Singh','customer004@example.com','Lucknow','2025-02-06'),
(5,'Nikhil Gupta','customer005@example.com','Jaipur','2025-12-09'),
(6,'Rahul Joshi','customer006@example.com','Ahmedabad','2025-03-09'),
(7,'Pooja Mehta','customer007@example.com','Jaipur','2025-05-05'),
(8,'Meera Patel','customer008@example.com','Pune','2025-02-18'),
(9,'Meera Singh','customer009@example.com','Kolkata','2025-08-05'),
(10,'Priya Sharma','customer010@example.com','Pune','2025-12-11'),
(11,'Vivaan Khan','customer011@example.com','Chennai','2026-01-08'),
(12,'Arjun Patel','customer012@example.com','Bengaluru','2025-04-09'),
(13,'Kavya Mehta','customer013@example.com','Kolkata','2025-03-13'),
(14,'Rohan Gupta','customer014@example.com','Bengaluru','2025-08-25'),
(15,'Aditya Mehta','customer015@example.com','Lucknow','2026-02-18'),
(16,'Arjun Sharma','customer016@example.com','Lucknow','2025-11-30'),
(17,'Aarav Verma','customer017@example.com','Bengaluru','2026-04-20'),
(18,'Rohan Khan','customer018@example.com','Jaipur','2025-09-06'),
(19,'Rahul Khan','customer019@example.com','Mumbai','2026-04-08'),
(20,'Rohan Khan','customer020@example.com','Kolkata','2025-01-02'),
(21,'Kunal Mehta','customer021@example.com','Kolkata','2025-05-27'),
(22,'Kavya Mehta','customer022@example.com','Bengaluru','2025-03-21'),
(23,'Aman Patel','customer023@example.com','Mumbai','2026-05-11'),
(24,'Pooja Joshi','customer024@example.com','Chennai','2025-02-01'),
(25,'Vivaan Sharma','customer025@example.com','Jaipur','2025-10-27'),
(26,'Sneha Joshi','customer026@example.com','Mumbai','2025-03-22'),
(27,'Sneha Verma','customer027@example.com','Delhi','2026-03-12'),
(28,'Aditya Yadav','customer028@example.com','Bengaluru','2025-02-04'),
(29,'Isha Verma','customer029@example.com','Ahmedabad','2026-04-28'),
(30,'Nikhil Yadav','customer030@example.com','Mumbai','2025-11-01'),
(31,'Neha Verma','customer031@example.com','Ahmedabad','2025-08-03'),
(32,'Pooja Joshi','customer032@example.com','Hyderabad','2025-06-11'),
(33,'Rahul Singh','customer033@example.com','Hyderabad','2025-05-03'),
(34,'Isha Tiwari','customer034@example.com','Hyderabad','2025-12-10'),
(35,'Priya Singh','customer035@example.com','Pune','2026-04-21'),
(36,'Aarav Mehta','customer036@example.com','Ahmedabad','2025-11-15'),
(37,'Arjun Verma','customer037@example.com','Bengaluru','2025-10-03'),
(38,'Sneha Gupta','customer038@example.com','Chennai','2025-03-09'),
(39,'Aditya Patel','customer039@example.com','Hyderabad','2025-07-09'),
(40,'Rohan Mehta','customer040@example.com','Lucknow','2026-03-03'),
(41,'Aman Yadav','customer041@example.com','Lucknow','2026-02-18'),
(42,'Aarav Joshi','customer042@example.com','Pune','2025-06-03'),
(43,'Kabir Gupta','customer043@example.com','Pune','2025-03-01'),
(44,'Kavya Tiwari','customer044@example.com','Hyderabad','2025-05-20'),
(45,'Neha Patel','customer045@example.com','Chennai','2026-01-03'),
(46,'Rahul Gupta','customer046@example.com','Jaipur','2025-09-16'),
(47,'Kunal Sharma','customer047@example.com','Kolkata','2025-02-17'),
(48,'Kunal Sharma','customer048@example.com','Chennai','2025-01-02'),
(49,'Kabir Gupta','customer049@example.com','Jaipur','2025-03-24'),
(50,'Kavya Khan','customer050@example.com','Mumbai','2025-10-15'),
(51,'Arjun Verma','customer051@example.com','Delhi','2026-04-29'),
(52,'Kavya Sharma','customer052@example.com','Chennai','2026-03-04'),
(53,'Pooja Joshi','customer053@example.com','Kolkata','2025-03-17'),
(54,'Kabir Sharma','customer054@example.com','Chennai','2025-06-07'),
(55,'Vivaan Singh','customer055@example.com','Bengaluru','2025-04-18'),
(56,'Arjun Singh','customer056@example.com','Lucknow','2026-02-04'),
(57,'Meera Yadav','customer057@example.com','Delhi','2026-01-19'),
(58,'Nikhil Tiwari','customer058@example.com','Delhi','2026-05-15'),
(59,'Meera Sharma','customer059@example.com','Chennai','2025-04-02'),
(60,'Meera Patel','customer060@example.com','Delhi','2025-05-17'),
(61,'Arjun Khan','customer061@example.com','Mumbai','2026-03-23'),
(62,'Riya Patel','customer062@example.com','Jaipur','2025-04-13'),
(63,'Diya Gupta','customer063@example.com','Bengaluru','2026-02-25'),
(64,'Nikhil Sharma','customer064@example.com','Bengaluru','2025-12-04'),
(65,'Isha Singh','customer065@example.com','Pune','2025-05-23'),
(66,'Kunal Singh','customer066@example.com','Lucknow','2025-11-25'),
(67,'Isha Joshi','customer067@example.com','Mumbai','2025-06-19'),
(68,'Arjun Gupta','customer068@example.com','Ahmedabad','2025-04-02'),
(69,'Kunal Sharma','customer069@example.com','Ahmedabad','2025-02-25'),
(70,'Meera Singh','customer070@example.com','Chennai','2026-01-09'),
(71,'Meera Yadav','customer071@example.com','Pune','2025-09-19'),
(72,'Isha Yadav','customer072@example.com','Hyderabad','2025-04-08'),
(73,'Vivaan Khan','customer073@example.com','Lucknow','2025-01-01'),
(74,'Kavya Patel','customer074@example.com','Kolkata','2025-07-06'),
(75,'Aditya Singh','customer075@example.com','Chennai','2025-11-16'),
(76,'Arjun Gupta','customer076@example.com','Hyderabad','2025-09-17'),
(77,'Meera Singh','customer077@example.com','Hyderabad','2025-07-26'),
(78,'Kavya Tiwari','customer078@example.com','Kolkata','2025-04-09'),
(79,'Isha Tiwari','customer079@example.com','Ahmedabad','2025-11-12'),
(80,'Aman Khan','customer080@example.com','Mumbai','2025-10-08'),
(81,'Aman Gupta','customer081@example.com','Kolkata','2025-04-18'),
(82,'Pooja Yadav','customer082@example.com','Chennai','2025-12-02'),
(83,'Priya Mehta','customer083@example.com','Bengaluru','2025-08-15'),
(84,'Sneha Mehta','customer084@example.com','Delhi','2026-02-11'),
(85,'Aditya Gupta','customer085@example.com','Ahmedabad','2025-09-21'),
(86,'Ananya Verma','customer086@example.com','Bengaluru','2026-02-24'),
(87,'Aman Patel','customer087@example.com','Bengaluru','2026-02-17'),
(88,'Kabir Sharma','customer088@example.com','Bengaluru','2025-01-24'),
(89,'Riya Yadav','customer089@example.com','Pune','2026-03-12'),
(90,'Priya Khan','customer090@example.com','Ahmedabad','2026-03-30'),
(91,'Rahul Khan','customer091@example.com','Kolkata','2025-09-11'),
(92,'Nikhil Tiwari','customer092@example.com','Mumbai','2025-12-02'),
(93,'Arjun Khan','customer093@example.com','Delhi','2025-04-23'),
(94,'Sneha Mehta','customer094@example.com','Lucknow','2025-01-26'),
(95,'Nikhil Verma','customer095@example.com','Delhi','2025-08-22'),
(96,'Priya Joshi','customer096@example.com','Ahmedabad','2025-10-14'),
(97,'Ananya Mehta','customer097@example.com','Lucknow','2025-11-10'),
(98,'Meera Joshi','customer098@example.com','Delhi','2025-08-17'),
(99,'Riya Mehta','customer099@example.com','Bengaluru','2025-05-13'),
(100,'Kunal Joshi','customer100@example.com','Bengaluru','2025-09-06');
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderStatus) VALUES
(1,7,'2025-11-18','Shipped'),
(2,14,'2025-08-09','Processing'),
(3,21,'2025-11-24','Delivered'),
(4,28,'2025-11-17','Delivered'),
(5,35,'2025-12-11','Cancelled'),
(6,42,'2025-08-11','Delivered'),
(7,49,'2025-09-16','Delivered'),
(8,56,'2026-01-13','Processing'),
(9,63,'2025-09-17','Processing'),
(10,70,'2025-10-18','Delivered'),
(11,77,'2026-01-29','Shipped'),
(12,84,'2025-12-17','Cancelled'),
(13,91,'2026-02-24','Shipped'),
(14,98,'2025-08-01','Delivered'),
(15,5,'2026-02-01','Shipped'),
(16,12,'2026-07-30','Cancelled'),
(17,19,'2026-06-22','Delivered'),
(18,26,'2026-07-27','Cancelled'),
(19,33,'2026-01-11','Shipped'),
(20,40,'2025-07-04','Delivered'),
(21,47,'2025-11-30','Shipped'),
(22,54,'2026-01-31','Cancelled'),
(23,61,'2026-07-18','Processing'),
(24,68,'2026-04-06','Cancelled'),
(25,75,'2025-10-21','Shipped'),
(26,82,'2025-10-21','Delivered'),
(27,89,'2026-02-09','Shipped'),
(28,96,'2025-07-15','Shipped'),
(29,3,'2025-12-20','Processing'),
(30,10,'2026-06-13','Shipped'),
(31,17,'2026-07-06','Delivered'),
(32,24,'2026-02-25','Delivered'),
(33,31,'2026-05-15','Cancelled'),
(34,38,'2025-07-14','Shipped'),
(35,45,'2026-04-30','Cancelled'),
(36,52,'2026-06-05','Delivered'),
(37,59,'2025-08-12','Processing'),
(38,66,'2026-02-05','Delivered'),
(39,73,'2026-02-22','Delivered'),
(40,80,'2025-07-26','Delivered'),
(41,87,'2026-01-11','Delivered'),
(42,94,'2025-10-17','Shipped'),
(43,1,'2025-12-15','Delivered'),
(44,8,'2026-07-25','Shipped'),
(45,15,'2025-11-20','Shipped'),
(46,22,'2025-11-07','Delivered'),
(47,29,'2026-02-26','Delivered'),
(48,36,'2026-07-19','Cancelled'),
(49,43,'2025-07-27','Delivered'),
(50,50,'2025-10-23','Processing'),
(51,57,'2025-08-05','Processing'),
(52,64,'2025-07-21','Delivered'),
(53,71,'2025-11-04','Delivered'),
(54,78,'2025-07-11','Cancelled'),
(55,85,'2025-09-17','Delivered'),
(56,92,'2025-09-03','Shipped'),
(57,99,'2026-06-08','Delivered'),
(58,6,'2026-04-15','Delivered'),
(59,13,'2026-02-24','Processing'),
(60,20,'2025-11-09','Delivered'),
(61,27,'2025-09-24','Cancelled'),
(62,34,'2026-05-07','Processing'),
(63,41,'2026-07-03','Delivered'),
(64,48,'2025-09-22','Delivered'),
(65,55,'2025-08-25','Cancelled'),
(66,62,'2025-07-14','Delivered'),
(67,69,'2026-04-21','Processing'),
(68,76,'2026-01-09','Shipped'),
(69,83,'2026-07-02','Delivered'),
(70,90,'2025-08-08','Cancelled'),
(71,97,'2026-06-19','Processing'),
(72,4,'2025-11-02','Delivered'),
(73,11,'2026-06-22','Delivered'),
(74,18,'2026-06-16','Cancelled'),
(75,25,'2025-08-31','Cancelled'),
(76,32,'2025-07-22','Delivered'),
(77,39,'2026-03-30','Shipped'),
(78,46,'2026-06-04','Delivered'),
(79,53,'2025-08-05','Cancelled'),
(80,60,'2026-05-28','Delivered'),
(81,67,'2025-07-07','Shipped'),
(82,74,'2026-03-08','Delivered'),
(83,81,'2026-02-07','Delivered'),
(84,88,'2026-05-22','Shipped'),
(85,95,'2026-06-28','Delivered'),
(86,2,'2026-02-08','Delivered'),
(87,9,'2026-07-11','Cancelled'),
(88,16,'2026-05-30','Delivered'),
(89,23,'2026-05-12','Cancelled'),
(90,30,'2026-03-05','Shipped'),
(91,37,'2026-02-09','Processing'),
(92,44,'2026-04-30','Delivered'),
(93,51,'2025-12-13','Delivered'),
(94,58,'2025-08-14','Delivered'),
(95,65,'2026-02-16','Delivered'),
(96,72,'2026-07-20','Shipped'),
(97,79,'2026-04-18','Cancelled'),
(98,86,'2026-06-08','Shipped'),
(99,93,'2025-12-20','Delivered'),
(100,100,'2026-03-11','Delivered');
INSERT INTO OrderDetails (DetailID, OrderID, ProductID, Quantity, UnitPrice) VALUES
(1,3,11,2,1564.28),
(2,6,22,4,4764.72),
(3,9,33,2,1613.60),
(4,12,44,3,701.37),
(5,15,55,3,2359.59),
(6,18,66,3,3682.19),
(7,21,77,3,1605.03),
(8,24,88,5,782.01),
(9,27,99,3,4793.48),
(10,30,10,5,562.20),
(11,33,21,1,5249.09),
(12,36,32,5,1961.55),
(13,39,43,2,635.07),
(14,42,54,1,3034.44),
(15,45,65,2,3898.67),
(16,48,76,4,952.13),
(17,51,87,4,1220.34),
(18,54,98,5,3203.21),
(19,57,9,2,1126.16),
(20,60,20,4,991.88),
(21,63,31,4,2100.73),
(22,66,42,4,438.76),
(23,69,53,1,1468.60),
(24,72,64,1,3386.27),
(25,75,75,3,1279.02),
(26,78,86,2,521.34),
(27,81,97,4,4883.59),
(28,84,8,2,644.39),
(29,87,19,3,3158.36),
(30,90,30,5,4340.03),
(31,93,41,3,1149.02),
(32,96,52,4,1334.22),
(33,99,63,5,2972.86),
(34,2,74,5,850.28),
(35,5,85,3,683.09),
(36,8,96,4,2672.49),
(37,11,7,5,1802.48),
(38,14,18,3,2564.31),
(39,17,29,3,5436.55),
(40,20,40,4,1687.54),
(41,23,51,3,1709.91),
(42,26,62,3,3241.80),
(43,29,73,3,1557.00),
(44,32,84,2,1130.77),
(45,35,95,1,1527.94),
(46,38,6,2,1492.58),
(47,41,17,3,1569.14),
(48,44,28,1,2059.40),
(49,47,39,5,2198.87),
(50,50,50,2,782.71),
(51,53,61,2,4373.62),
(52,56,72,2,1640.72),
(53,59,83,4,849.43),
(54,62,94,3,2818.37),
(55,65,5,5,1578.54),
(56,68,16,5,2444.71),
(57,71,27,5,2041.54),
(58,74,38,3,1761.57),
(59,77,49,1,1074.74),
(60,80,60,2,1731.59),
(61,83,71,3,719.81),
(62,86,82,2,560.34),
(63,89,93,3,4149.41),
(64,92,4,2,840.37),
(65,95,15,3,2727.87),
(66,98,26,1,3138.42),
(67,1,37,5,2140.79),
(68,4,48,2,689.06),
(69,7,59,3,1226.42),
(70,10,70,1,2036.35),
(71,13,81,1,828.57),
(72,16,92,5,3557.03),
(73,19,3,3,914.90),
(74,22,14,2,1510.85),
(75,25,25,4,5930.09),
(76,28,36,1,1642.03),
(77,31,47,1,498.25),
(78,34,58,5,2549.19),
(79,37,69,3,2190.85),
(80,40,80,4,764.66),
(81,43,91,4,1693.89),
(82,46,2,4,555.32),
(83,49,13,3,1045.95),
(84,52,24,2,2323.73),
(85,55,35,1,1330.03),
(86,58,46,3,640.35),
(87,61,57,4,1244.51),
(88,64,68,1,1273.30),
(89,67,79,1,787.62),
(90,70,90,4,366.67),
(91,73,1,4,1438.97),
(92,76,12,1,2337.90),
(93,79,23,5,3154.86),
(94,82,34,1,2399.21),
(95,85,45,2,475.38),
(96,88,56,2,2268.62),
(97,91,67,5,1911.05),
(98,94,78,3,1031.68),
(99,97,89,1,406.00),
(100,100,100,2,4396.61);
INSERT INTO Reviews (ReviewID, ProductID, CustomerID, Rating, Comment) VALUES
(1,13,17,2,'Could be better'),
(2,26,34,5,'Highly recommended'),
(3,39,51,3,'Could be better'),
(4,52,68,5,'Product met expectations'),
(5,65,85,5,'Would buy again'),
(6,78,2,5,'Would buy again'),
(7,91,19,2,'Highly recommended'),
(8,4,36,2,'Average experience'),
(9,17,53,3,'Would buy again'),
(10,30,70,2,'Excellent product'),
(11,43,87,3,'Excellent product'),
(12,56,4,2,'Excellent product'),
(13,69,21,2,'Nice packaging'),
(14,82,38,5,'Highly recommended'),
(15,95,55,5,'Would buy again'),
(16,8,72,2,'Average experience'),
(17,21,89,4,'Would buy again'),
(18,34,6,5,'Value for money'),
(19,47,23,3,'Would buy again'),
(20,60,40,3,'Nice packaging'),
(21,73,57,2,'Could be better'),
(22,86,74,3,'Excellent product'),
(23,99,91,4,'Excellent product'),
(24,12,8,2,'Good quality'),
(25,25,25,3,'Would buy again'),
(26,38,42,4,'Product met expectations'),
(27,51,59,2,'Product met expectations'),
(28,64,76,4,'Nice packaging'),
(29,77,93,4,'Could be better'),
(30,90,10,5,'Product met expectations'),
(31,3,27,2,'Highly recommended'),
(32,16,44,2,'Nice packaging'),
(33,29,61,4,'Highly recommended'),
(34,42,78,4,'Good quality'),
(35,55,95,2,'Average experience'),
(36,68,12,2,'Would buy again'),
(37,81,29,2,'Excellent product'),
(38,94,46,5,'Could be better'),
(39,7,63,5,'Would buy again'),
(40,20,80,3,'Highly recommended'),
(41,33,97,5,'Product met expectations'),
(42,46,14,2,'Product met expectations'),
(43,59,31,4,'Nice packaging'),
(44,72,48,4,'Fast delivery'),
(45,85,65,2,'Excellent product'),
(46,98,82,4,'Nice packaging'),
(47,11,99,5,'Would buy again'),
(48,24,16,5,'Could be better'),
(49,37,33,2,'Product met expectations'),
(50,50,50,2,'Fast delivery'),
(51,63,67,4,'Fast delivery'),
(52,76,84,2,'Nice packaging'),
(53,89,1,2,'Could be better'),
(54,2,18,5,'Nice packaging'),
(55,15,35,2,'Average experience'),
(56,28,52,4,'Highly recommended'),
(57,41,69,5,'Product met expectations'),
(58,54,86,2,'Average experience'),
(59,67,3,4,'Could be better'),
(60,80,20,3,'Would buy again'),
(61,93,37,5,'Product met expectations'),
(62,6,54,2,'Good quality'),
(63,19,71,3,'Excellent product'),
(64,32,88,4,'Could be better'),
(65,45,5,2,'Could be better'),
(66,58,22,5,'Value for money'),
(67,71,39,3,'Value for money'),
(68,84,56,5,'Value for money'),
(69,97,73,3,'Product met expectations'),
(70,10,90,4,'Could be better'),
(71,23,7,4,'Nice packaging'),
(72,36,24,5,'Product met expectations'),
(73,49,41,3,'Product met expectations'),
(74,62,58,3,'Nice packaging'),
(75,75,75,3,'Highly recommended'),
(76,88,92,3,'Value for money'),
(77,1,9,4,'Nice packaging'),
(78,14,26,4,'Could be better'),
(79,27,43,4,'Good quality'),
(80,40,60,4,'Would buy again'),
(81,53,77,5,'Excellent product'),
(82,66,94,5,'Could be better'),
(83,79,11,5,'Fast delivery'),
(84,92,28,4,'Could be better'),
(85,5,45,5,'Product met expectations'),
(86,18,62,4,'Average experience'),
(87,31,79,3,'Highly recommended'),
(88,44,96,5,'Average experience'),
(89,57,13,5,'Good quality'),
(90,70,30,4,'Product met expectations'),
(91,83,47,5,'Nice packaging'),
(92,96,64,3,'Product met expectations'),
(93,9,81,2,'Excellent product'),
(94,22,98,4,'Value for money'),
(95,35,15,5,'Value for money'),
(96,48,32,5,'Good quality'),
(97,61,49,3,'Nice packaging'),
(98,74,66,3,'Value for money'),
(99,87,83,5,'Would buy again'),
(100,100,100,4,'Highly recommended');
INSERT INTO Shipping (ShippingID, OrderID, ShipDate, DeliveryDate, ShippingStatus) VALUES
(1,1,'2025-11-21','2025-11-28','In Transit'),
(2,2,'2025-08-12','2025-08-14','Preparing'),
(3,3,'2025-11-26','2025-12-03','Delivered'),
(4,4,'2025-11-19','2025-11-27','Delivered'),
(5,5,'2025-12-13',NULL,'Cancelled'),
(6,6,'2025-08-12','2025-08-14','Delivered'),
(7,7,'2025-09-17','2025-09-22','Delivered'),
(8,8,'2026-01-14','2026-01-16','Preparing'),
(9,9,'2025-09-19','2025-09-21','Preparing'),
(10,10,'2025-10-21','2025-10-23','Delivered'),
(11,11,'2026-01-31','2026-02-03','In Transit'),
(12,12,'2025-12-19',NULL,'Cancelled'),
(13,13,'2026-02-26','2026-02-27','In Transit'),
(14,14,'2025-08-02','2025-08-08','Delivered'),
(15,15,'2026-02-02','2026-02-07','In Transit'),
(16,16,'2026-07-31',NULL,'Cancelled'),
(17,17,'2026-06-24','2026-07-01','Delivered'),
(18,18,'2026-07-27',NULL,'Cancelled'),
(19,19,'2026-01-12','2026-01-19','In Transit'),
(20,20,'2025-07-07','2025-07-10','Delivered'),
(21,21,'2025-12-01','2025-12-04','In Transit'),
(22,22,'2026-01-31',NULL,'Cancelled'),
(23,23,'2026-07-21','2026-07-28','Preparing'),
(24,24,'2026-04-08',NULL,'Cancelled'),
(25,25,'2025-10-24','2025-10-28','In Transit'),
(26,26,'2025-10-23','2025-10-26','Delivered'),
(27,27,'2026-02-10','2026-02-18','In Transit'),
(28,28,'2025-07-18','2025-07-23','In Transit'),
(29,29,'2025-12-22','2025-12-27','Preparing'),
(30,30,'2026-06-16','2026-06-17','In Transit'),
(31,31,'2026-07-08','2026-07-13','Delivered'),
(32,32,'2026-02-28','2026-03-03','Delivered'),
(33,33,'2026-05-15',NULL,'Cancelled'),
(34,34,'2025-07-16','2025-07-22','In Transit'),
(35,35,'2026-05-02',NULL,'Cancelled'),
(36,36,'2026-06-07','2026-06-14','Delivered'),
(37,37,'2025-08-15','2025-08-20','Preparing'),
(38,38,'2026-02-07','2026-02-12','Delivered'),
(39,39,'2026-02-23','2026-03-02','Delivered'),
(40,40,'2025-07-28','2025-07-30','Delivered'),
(41,41,'2026-01-12','2026-01-19','Delivered'),
(42,42,'2025-10-20','2025-10-26','In Transit'),
(43,43,'2025-12-18','2025-12-23','Delivered'),
(44,44,'2026-07-28','2026-08-02','In Transit'),
(45,45,'2025-11-21','2025-11-28','In Transit'),
(46,46,'2025-11-09','2025-11-10','Delivered'),
(47,47,'2026-03-01','2026-03-02','Delivered'),
(48,48,'2026-07-21',NULL,'Cancelled'),
(49,49,'2025-07-30','2025-08-07','Delivered'),
(50,50,'2025-10-25','2025-10-29','Preparing'),
(51,51,'2025-08-08','2025-08-14','Preparing'),
(52,52,'2025-07-22','2025-07-26','Delivered'),
(53,53,'2025-11-07','2025-11-12','Delivered'),
(54,54,'2025-07-13',NULL,'Cancelled'),
(55,55,'2025-09-20','2025-09-23','Delivered'),
(56,56,'2025-09-06','2025-09-08','In Transit'),
(57,57,'2026-06-11','2026-06-12','Delivered'),
(58,58,'2026-04-17','2026-04-25','Delivered'),
(59,59,'2026-02-25','2026-03-03','Preparing'),
(60,60,'2025-11-12','2025-11-15','Delivered'),
(61,61,'2025-09-24',NULL,'Cancelled'),
(62,62,'2026-05-09','2026-05-15','Preparing'),
(63,63,'2026-07-06','2026-07-13','Delivered'),
(64,64,'2025-09-23','2025-09-27','Delivered'),
(65,65,'2025-08-25',NULL,'Cancelled'),
(66,66,'2025-07-17','2025-07-23','Delivered'),
(67,67,'2026-04-24','2026-04-29','Preparing'),
(68,68,'2026-01-10','2026-01-15','In Transit'),
(69,69,'2026-07-04','2026-07-09','Delivered'),
(70,70,'2025-08-10',NULL,'Cancelled'),
(71,71,'2026-06-21','2026-06-23','Preparing'),
(72,72,'2025-11-04','2025-11-06','Delivered'),
(73,73,'2026-06-23','2026-06-27','Delivered'),
(74,74,'2026-06-18',NULL,'Cancelled'),
(75,75,'2025-09-02',NULL,'Cancelled'),
(76,76,'2025-07-25','2025-08-01','Delivered'),
(77,77,'2026-04-02','2026-04-08','In Transit'),
(78,78,'2026-06-05','2026-06-12','Delivered'),
(79,79,'2025-08-05',NULL,'Cancelled'),
(80,80,'2026-05-30','2026-06-01','Delivered'),
(81,81,'2025-07-09','2025-07-15','In Transit'),
(82,82,'2026-03-11','2026-03-16','Delivered'),
(83,83,'2026-02-10','2026-02-17','Delivered'),
(84,84,'2026-05-25','2026-05-31','In Transit'),
(85,85,'2026-06-29','2026-07-03','Delivered'),
(86,86,'2026-02-10','2026-02-11','Delivered'),
(87,87,'2026-07-13',NULL,'Cancelled'),
(88,88,'2026-06-02','2026-06-08','Delivered'),
(89,89,'2026-05-14',NULL,'Cancelled'),
(90,90,'2026-03-06','2026-03-08','In Transit'),
(91,91,'2026-02-12','2026-02-20','Preparing'),
(92,92,'2026-05-03','2026-05-08','Delivered'),
(93,93,'2025-12-16','2025-12-23','Delivered'),
(94,94,'2025-08-15','2025-08-18','Delivered'),
(95,95,'2026-02-17','2026-02-18','Delivered'),
(96,96,'2026-07-22','2026-07-30','In Transit'),
(97,97,'2026-04-18',NULL,'Cancelled'),
(98,98,'2026-06-09','2026-06-13','In Transit'),
(99,99,'2025-12-23','2025-12-26','Delivered'),
(100,100,'2026-03-13','2026-03-21','Delivered');
INSERT INTO Discounts (DiscountID, ProductID, DiscountAmount) VALUES
(1,7,270.37),
(2,14,377.71),
(3,21,1049.82),
(4,28,514.85),
(5,35,133.00),
(6,42,87.75),
(7,49,53.74),
(8,56,453.72),
(9,63,743.22),
(10,70,407.27),
(11,77,240.75),
(12,84,56.54),
(13,91,254.08),
(14,98,320.32),
(15,5,315.71),
(16,12,467.58),
(17,19,315.84),
(18,26,470.76),
(19,33,80.68),
(20,40,253.13),
(21,47,124.56),
(22,54,455.17),
(23,61,218.68),
(24,68,254.66),
(25,75,191.85),
(26,82,56.03),
(27,89,20.30),
(28,96,534.50),
(29,3,45.75),
(30,10,56.22),
(31,17,392.29),
(32,24,116.19),
(33,31,105.04),
(34,38,264.24),
(35,45,47.54),
(36,52,133.42),
(37,59,306.61),
(38,66,368.22),
(39,73,77.85),
(40,80,191.16),
(41,87,122.03),
(42,94,704.59),
(43,1,143.90),
(44,8,64.44),
(45,15,409.18),
(46,22,476.47),
(47,29,1359.14),
(48,36,82.10),
(49,43,95.26),
(50,50,78.27),
(51,57,124.45),
(52,64,846.57),
(53,71,107.97),
(54,78,103.17),
(55,85,34.15),
(56,92,177.85),
(57,99,479.35),
(58,6,74.63),
(59,13,156.89),
(60,20,99.19),
(61,27,510.38),
(62,34,359.88),
(63,41,57.45),
(64,48,68.91),
(65,55,353.94),
(66,62,162.09),
(67,69,219.09),
(68,76,190.43),
(69,83,212.36),
(70,90,18.33),
(71,97,244.18),
(72,4,168.07),
(73,11,312.86),
(74,18,384.65),
(75,25,1482.52),
(76,32,490.39),
(77,39,109.94),
(78,46,128.07),
(79,53,367.15),
(80,60,173.16),
(81,67,477.76),
(82,74,42.51),
(83,81,207.14),
(84,88,117.30),
(85,95,305.59),
(86,2,27.77),
(87,9,56.31),
(88,16,488.94),
(89,23,630.97),
(90,30,868.01),
(91,37,107.04),
(92,44,140.27),
(93,51,341.98),
(94,58,127.46),
(95,65,194.93),
(96,72,246.11),
(97,79,196.91),
(98,86,52.13),
(99,93,207.47),
(100,100,439.66);
INSERT INTO Coupons (CouponID, CouponCode, DiscountAmount, MinOrderValue, ExpiryDate) VALUES
(1,'SAVE001',100.00,2500.00,'2026-06-04'),
(2,'SAVE002',250.00,2500.00,'2026-06-07'),
(3,'SAVE003',200.00,1500.00,'2026-06-10'),
(4,'SAVE004',150.00,2500.00,'2026-06-13'),
(5,'SAVE005',200.00,1500.00,'2026-06-16'),
(6,'SAVE006',150.00,2500.00,'2026-06-19'),
(7,'SAVE007',200.00,2000.00,'2026-06-22'),
(8,'SAVE008',50.00,500.00,'2026-06-25'),
(9,'SAVE009',300.00,2500.00,'2026-06-28'),
(10,'SAVE010',250.00,1000.00,'2026-07-01'),
(11,'SAVE011',150.00,2000.00,'2026-07-04'),
(12,'SAVE012',75.00,2000.00,'2026-07-07'),
(13,'SAVE013',100.00,2000.00,'2026-07-10'),
(14,'SAVE014',150.00,2000.00,'2026-07-13'),
(15,'SAVE015',250.00,500.00,'2026-07-16'),
(16,'SAVE016',100.00,2000.00,'2026-07-19'),
(17,'SAVE017',100.00,1500.00,'2026-07-22'),
(18,'SAVE018',100.00,1000.00,'2026-07-25'),
(19,'SAVE019',250.00,2000.00,'2026-07-28'),
(20,'SAVE020',50.00,500.00,'2026-07-31'),
(21,'SAVE021',300.00,500.00,'2026-08-03'),
(22,'SAVE022',50.00,2000.00,'2026-08-06'),
(23,'SAVE023',50.00,1500.00,'2026-08-09'),
(24,'SAVE024',300.00,1000.00,'2026-08-12'),
(25,'SAVE025',200.00,500.00,'2026-08-15'),
(26,'SAVE026',200.00,2500.00,'2026-08-18'),
(27,'SAVE027',200.00,1500.00,'2026-08-21'),
(28,'SAVE028',250.00,500.00,'2026-08-24'),
(29,'SAVE029',150.00,1500.00,'2026-08-27'),
(30,'SAVE030',300.00,2000.00,'2026-08-30'),
(31,'SAVE031',300.00,500.00,'2026-09-02'),
(32,'SAVE032',100.00,2500.00,'2026-09-05'),
(33,'SAVE033',100.00,1500.00,'2026-09-08'),
(34,'SAVE034',50.00,2500.00,'2026-09-11'),
(35,'SAVE035',200.00,1000.00,'2026-09-14'),
(36,'SAVE036',75.00,2000.00,'2026-09-17'),
(37,'SAVE037',75.00,500.00,'2026-09-20'),
(38,'SAVE038',100.00,2500.00,'2026-09-23'),
(39,'SAVE039',100.00,500.00,'2026-09-26'),
(40,'SAVE040',300.00,1500.00,'2026-09-29'),
(41,'SAVE041',200.00,1000.00,'2026-10-02'),
(42,'SAVE042',300.00,2000.00,'2026-10-05'),
(43,'SAVE043',300.00,2500.00,'2026-10-08'),
(44,'SAVE044',300.00,2500.00,'2026-10-11'),
(45,'SAVE045',200.00,2500.00,'2026-10-14'),
(46,'SAVE046',50.00,2500.00,'2026-10-17'),
(47,'SAVE047',250.00,1500.00,'2026-10-20'),
(48,'SAVE048',50.00,1000.00,'2026-10-23'),
(49,'SAVE049',100.00,1500.00,'2026-10-26'),
(50,'SAVE050',100.00,1500.00,'2026-10-29'),
(51,'SAVE051',50.00,1000.00,'2026-11-01'),
(52,'SAVE052',300.00,1000.00,'2026-11-04'),
(53,'SAVE053',200.00,2000.00,'2026-11-07'),
(54,'SAVE054',50.00,1000.00,'2026-11-10'),
(55,'SAVE055',250.00,500.00,'2026-11-13'),
(56,'SAVE056',50.00,2500.00,'2026-11-16'),
(57,'SAVE057',75.00,2000.00,'2026-11-19'),
(58,'SAVE058',150.00,2000.00,'2026-11-22'),
(59,'SAVE059',100.00,1000.00,'2026-11-25'),
(60,'SAVE060',100.00,1500.00,'2026-11-28'),
(61,'SAVE061',250.00,1500.00,'2026-12-01'),
(62,'SAVE062',300.00,2500.00,'2026-12-04'),
(63,'SAVE063',200.00,500.00,'2026-12-07'),
(64,'SAVE064',50.00,1000.00,'2026-12-10'),
(65,'SAVE065',75.00,2500.00,'2026-12-13'),
(66,'SAVE066',50.00,500.00,'2026-12-16'),
(67,'SAVE067',100.00,2000.00,'2026-12-19'),
(68,'SAVE068',250.00,2000.00,'2026-12-22'),
(69,'SAVE069',150.00,2500.00,'2026-12-25'),
(70,'SAVE070',150.00,2000.00,'2026-12-28'),
(71,'SAVE071',100.00,1000.00,'2026-12-31'),
(72,'SAVE072',300.00,2500.00,'2027-01-03'),
(73,'SAVE073',50.00,1500.00,'2027-01-06'),
(74,'SAVE074',150.00,500.00,'2027-01-09'),
(75,'SAVE075',100.00,2500.00,'2027-01-12'),
(76,'SAVE076',150.00,2500.00,'2027-01-15'),
(77,'SAVE077',250.00,1500.00,'2027-01-18'),
(78,'SAVE078',50.00,1000.00,'2027-01-21'),
(79,'SAVE079',150.00,2500.00,'2027-01-24'),
(80,'SAVE080',50.00,500.00,'2027-01-27'),
(81,'SAVE081',75.00,1500.00,'2027-01-30'),
(82,'SAVE082',75.00,1000.00,'2027-02-02'),
(83,'SAVE083',300.00,1500.00,'2027-02-05'),
(84,'SAVE084',100.00,1500.00,'2027-02-08'),
(85,'SAVE085',50.00,500.00,'2027-02-11'),
(86,'SAVE086',150.00,2000.00,'2027-02-14'),
(87,'SAVE087',75.00,1000.00,'2027-02-17'),
(88,'SAVE088',150.00,2500.00,'2027-02-20'),
(89,'SAVE089',250.00,1000.00,'2027-02-23'),
(90,'SAVE090',200.00,2500.00,'2027-02-26'),
(91,'SAVE091',300.00,1500.00,'2027-03-01'),
(92,'SAVE092',50.00,2000.00,'2027-03-04'),
(93,'SAVE093',300.00,500.00,'2027-03-07'),
(94,'SAVE094',150.00,500.00,'2027-03-10'),
(95,'SAVE095',150.00,500.00,'2027-03-13'),
(96,'SAVE096',300.00,1500.00,'2027-03-16'),
(97,'SAVE097',200.00,2000.00,'2027-03-19'),
(98,'SAVE098',200.00,2000.00,'2027-03-22'),
(99,'SAVE099',250.00,2000.00,'2027-03-25'),
(100,'SAVE100',100.00,500.00,'2027-03-28');



-- 1 Total revenue from all order 
SELECT ROUND(SUM(Quantity * UnitPrice),2) AS TotalRevenue
 FROM OrderDetails;

-- 2 Total number of orders
SELECT COUNT(*) AS TotalOrders FROM Orders;

-- 3 Average order value
SELECT ROUND(AVG(OrderTotal),2) AS AverageOrderValue
 FROM (SELECT OrderID, SUM(Quantity*UnitPrice) OrderTotal
 FROM OrderDetails GROUP BY OrderID) x;

-- 4 Revenue by category
SELECT c.CategoryName,
 ROUND(SUM(od.Quantity*od.UnitPrice),2) Revenue FROM OrderDetails od
 JOIN Products p ON od.ProductID=p.ProductID 
 JOIN Categories c ON p.CategoryID=c.CategoryID
 GROUP BY c.CategoryName
 ORDER BY Revenue DESC;

-- 5 Top 10 products by revenue
SELECT p.ProductID,p.Name,
ROUND(SUM(od.Quantity*od.UnitPrice),2) Revenue
 FROM Products p
 JOIN OrderDetails od ON p.ProductID=od.ProductID 
 GROUP BY p.ProductID,p.Name 
 ORDER BY Revenue DESC LIMIT 10;

-- 6 Top products by quantity sold
SELECT p.Name,
SUM(od.Quantity) UnitsSold 
FROM Products p 
JOIN OrderDetails od ON p.ProductID=od.ProductID
GROUP BY p.ProductID,p.Name 
ORDER BY UnitsSold DESC LIMIT 10;

-- 7 Customer-wise revenue
SELECT c.CustomerID,c.Name,
ROUND(SUM(od.Quantity*od.UnitPrice),2) Revenue
 FROM Customers c 
 JOIN Orders o ON c.CustomerID=o.CustomerID
 JOIN OrderDetails od ON o.OrderID=od.OrderID
 GROUP BY c.CustomerID,c.Name
 ORDER BY Revenue DESC;

-- 8 Revenue by city
SELECT c.City,
ROUND(SUM(od.Quantity*od.UnitPrice),2) Revenue 
FROM Customers c
JOIN Orders o ON c.CustomerID=o.CustomerID 
JOIN OrderDetails od ON o.OrderID=od.OrderID
GROUP BY c.City
ORDER BY Revenue DESC;
 
 -- Finds the product with the highest discount, along with its actual price and discount amount.
SELECT p.Name,
p.Price AS ActualPrice,
d.DiscountAmount
FROM Products p
JOIN Discounts d ON p.ProductID = d.ProductID
ORDER BY d.DiscountAmount DESC;

-- 7. Top Selling Product
SELECT p.ProductID, p.Name,
SUM(od.Quantity) AS TotalSold FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.Name
ORDER BY TotalSold DESC
LIMIT 1;
 

-- 9 What is the monthly revenue growth percentage, 
-- and which month experienced the largest increase are decline?
 
 WITH M AS (
SELECT DATE_FORMAT(o.OrderDate,'%Y-%m') Month,
SUM(od.Quantity*od.UnitPrice) Revenue
FROM Orders o JOIN OrderDetails od ON o.OrderID=od.OrderID
GROUP BY Month
)
SELECT Month,
ROUND((Revenue-LAG(Revenue) OVER(ORDER BY Month))
/LAG(Revenue) OVER(ORDER BY Month)*100,2) Growth
FROM M;

-- 10 Do the top 20 % of product contribute apprimataly of 80% of total revenue
WITH P AS (
SELECT ProductID, SUM(Quantity*UnitPrice) Revenue
FROM OrderDetails GROUP BY ProductID
)
SELECT ROUND(
SUM(Revenue) / (SELECT SUM(Revenue) FROM P) * 100, 2
) AS Top20RevenuePercent
FROM (
SELECT Revenue FROM P
ORDER BY Revenue DESC LIMIT 20) x;
 
 -- 11 do discounted orders generate more revenue or higher order quantity more than non discounted order
 SELECT
CASE WHEN d.DiscountID IS NOT NULL THEN 'Discounted' ELSE 'Non-Discounted' END AS OrderType,
SUM(od.Quantity*od.UnitPrice) Revenue,
SUM(od.Quantity) Quantity
FROM Orders o
JOIN OrderDetails od ON o.OrderID=od.OrderID
JOIN Products p ON od.ProductID=p.ProductID
LEFT JOIN Discounts d ON p.ProductID=d.ProductID
GROUP BY OrderType;

-- 12 which coupons generate the highest additional sales related to the discount they provide 
SELECT c.CouponCode,
SUM(od.Quantity*od.UnitPrice) - SUM(c.DiscountAmount) AS AdditionalSales
FROM Coupons c
JOIN Orders o ON o.OrderID = c.CouponID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CouponCode ORDER BY AdditionalSales DESC;

-- 13 which products generate high revenue but have low average cutomers rating
SELECT p.Name,SUM(od.Quantity*od.UnitPrice) Revenue,
AVG(r.Rating) AvgRating FROM Products p
JOIN OrderDetails od ON p.ProductID=od.ProductID
JOIN Reviews r ON p.ProductID=r.ProductID
GROUP BY p.ProductID,p.Name
ORDER BY Revenue DESC, AvgRating ASC;

-- 14 can customers be segmented using RFM(Recency,Frequancy,Monitory) analize
SELECT o.CustomerID,
DATEDIFF(CURDATE(), MAX(o.OrderDate)) AS Recency,
COUNT(DISTINCT o.OrderID) AS Frequency,
SUM(od.Quantity * od.UnitPrice) AS Monetary
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.CustomerID
ORDER BY Monetary DESC;


 -- 15  Find the day with the highest total sales amount.
SELECT o.OrderDate,SUM(p.Price*od.Quantity) AS DailySales FROM Orders o
JOIN OrderDetails od ON o.OrderID=od.OrderID
JOIN Products p ON od.ProductID=p.ProductID
GROUP BY o.OrderDate
ORDER BY DailySales DESC LIMIT 1;

-- 16 Weekday vs Weekend Revenue
SELECT CASE WHEN DAYOFWEEK(o.OrderDate) IN (1, 7)
THEN 'Weekend' ELSE 'Weekday' END AS DayType,
SUM(od.Quantity * p.Price) AS Revenue FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY DayType;
 
-- 17 Monthly revenue
SELECT DATE_FORMAT(o.OrderDate,'%Y-%m') Month,
ROUND(SUM(od.Quantity*od.UnitPrice),2) Revenue 
FROM Orders o
 JOIN OrderDetails od ON o.OrderID=od.OrderID
 GROUP BY Month ORDER BY Month;
 
 -- 18 yearly revenue
SELECT YEAR(o.OrderDate),
SUM(p.Price*od.Quantity) AS Revenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID=od.OrderID
JOIN Products p ON od.ProductID=p.ProductID
GROUP BY YEAR(o.OrderDate);


-- 19  Revenue from delivered orders only
SELECT ROUND(SUM(od.Quantity*od.UnitPrice),2) DeliveredRevenue
 FROM Orders o 
 JOIN Shipping s ON o.OrderID=s.OrderID 
 JOIN OrderDetails od ON o.OrderID=od.OrderID 
 WHERE s.ShippingStatus='Delivered';

-- 20 Cancelled order value
SELECT ROUND(SUM(od.Quantity*od.UnitPrice),2) CancelledValue 
FROM Orders o
 JOIN OrderDetails od ON o.OrderID=od.OrderID
 WHERE o.OrderStatus='Cancelled';

-- 21 Revenue by order status
SELECT o.OrderStatus,
ROUND(SUM(od.Quantity*od.UnitPrice),2) Revenue
 FROM Orders o
 JOIN OrderDetails od ON o.OrderID=od.OrderID 
 GROUP BY o.OrderStatus 
 ORDER BY Revenue DESC;

-- 22 Orders by status
SELECT OrderStatus,
COUNT(*) OrdersCount
FROM Orders
GROUP BY OrderStatus
ORDER BY OrdersCount DESC;

-- 23 Delivered orders and delivery days
SELECT o.OrderID,DATEDIFF(s.DeliveryDate,s.ShipDate) DeliveryDays
 FROM Orders o
 JOIN Shipping s ON o.OrderID=s.OrderID
 WHERE s.DeliveryDate IS NOT NULL
 ORDER BY DeliveryDays DESC;

-- 24 Average delivery time by status
SELECT s.ShippingStatus,
ROUND(AVG(DATEDIFF(s.DeliveryDate,s.ShipDate)),2) AvgDeliveryDays
 FROM Shipping s
 WHERE s.DeliveryDate IS NOT NULL
 GROUP BY s.ShippingStatus;

-- 25 Late deliveries over 5 days
SELECT o.OrderID,c.Name,s.ShipDate,
s.DeliveryDate,DATEDIFF(s.DeliveryDate,s.ShipDate) Days
 FROM Orders o 
 JOIN Customers c ON o.CustomerID=c.CustomerID
 JOIN Shipping s ON o.OrderID=s.OrderID
 WHERE s.DeliveryDate IS NOT NULL AND DATEDIFF(s.DeliveryDate,s.ShipDate)>5 
 ORDER BY Days DESC;


-- 26 Products priced above average product price
SELECT p.ProductID,p.Name,p.Price
 FROM Products p
 WHERE p.Price>(SELECT AVG(Price) FROM Products) 
 ORDER BY p.Price DESC;


-- 27 Highest rated products
SELECT p.Name,
ROUND(AVG(r.Rating),2) AvgRating,COUNT(r.ReviewID) Reviews
 FROM Products p 
 JOIN Reviews r ON p.ProductID=r.ProductID 
 GROUP BY p.ProductID,p.Name 
 HAVING COUNT(r.ReviewID)>=1 
 ORDER BY AvgRating DESC,Reviews DESC LIMIT 10;

-- 28 Products with rating below overall average
SELECT p.Name, ROUND(AVG(r.Rating),2) AvgRating 
FROM Products p
JOIN Reviews r ON p.ProductID=r.ProductID 
GROUP BY p.ProductID,p.Name 
HAVING AVG(r.Rating)<(SELECT AVG(Rating)
FROM Reviews) ORDER BY AvgRating;

-- 29 Review count by customer
SELECT c.Name, COUNT(r.ReviewID) ReviewCount 
FROM Customers c
JOIN Reviews r ON c.CustomerID=r.CustomerID 
GROUP BY c.CustomerID,c.Name 
ORDER BY ReviewCount DESC;

-- 30 Average rating by category
SELECT c.CategoryName, ROUND(AVG(r.Rating),2) AvgRating
FROM Categories c 
JOIN Products p ON c.CategoryID=p.CategoryID 
JOIN Reviews r ON p.ProductID=r.ProductID 
GROUP BY c.CategoryID,c.CategoryName
ORDER BY AvgRating DESC;

-- 31 Discounted products with original and discount price
SELECT p.Name,p.Price,d.DiscountAmount,
ROUND(p.Price-d.DiscountAmount,2) SalePrice 
FROM Products p 
JOIN Discounts d ON p.ProductID=d.ProductID 
ORDER BY d.DiscountAmount DESC;

-- 32 Products with discount above average discount
SELECT p.Name,d.DiscountAmount 
FROM Products p
JOIN Discounts d ON p.ProductID=d.ProductID
WHERE d.DiscountAmount>(SELECT AVG(DiscountAmount) FROM Discounts) 
ORDER BY d.DiscountAmount DESC;

-- 33 Discount impact by category
SELECT c.CategoryName,
ROUND(AVG(d.DiscountAmount),2) AvgDiscount
FROM Categories c 
JOIN Products p ON c.CategoryID=p.CategoryID 
JOIN Discounts d ON p.ProductID=d.ProductID 
GROUP BY c.CategoryID,c.CategoryName 
 ORDER BY AvgDiscount DESC;

-- 24 Top customers by order count and revenue
SELECT c.Name,
COUNT(DISTINCT o.OrderID) Orders,
ROUND(SUM(od.Quantity*od.UnitPrice),2) Revenue 
FROM Customers c
JOIN Orders o ON c.CustomerID=o.CustomerID 
JOIN OrderDetails od ON o.OrderID=od.OrderID 
GROUP BY c.CustomerID,c.Name
ORDER BY Orders DESC,Revenue DESC LIMIT 10;

-- 25 Orders above average order value
SELECT o.OrderID,o.CustomerID,
ROUND(SUM(od.Quantity*od.UnitPrice),2) OrderValue 
FROM Orders o
JOIN OrderDetails od ON o.OrderID=od.OrderID 
GROUP BY o.OrderID,o.CustomerID 
HAVING SUM(od.Quantity*od.UnitPrice)>(SELECT AVG(OrderValue) 
FROM (SELECT SUM(Quantity*UnitPrice) OrderValue 
FROM OrderDetails
GROUP BY OrderID) x) ORDER BY OrderValue DESC;

-- 26 Largest order
SELECT o.OrderID,c.Name,
ROUND(SUM(od.Quantity*od.UnitPrice),2) OrderValue
FROM Orders o 
JOIN Customers c ON o.CustomerID=c.CustomerID 
JOIN OrderDetails od ON o.OrderID=od.OrderID 
GROUP BY o.OrderID,c.Name 
ORDER BY OrderValue DESC LIMIT 1;

-- 27 Smallest order
SELECT o.OrderID,c.Name,
ROUND(SUM(od.Quantity*od.UnitPrice),2) OrderValue
FROM Orders o 
JOIN Customers c ON o.CustomerID=c.CustomerID 
JOIN OrderDetails od ON o.OrderID=od.OrderID
GROUP BY o.OrderID,c.Name
ORDER BY OrderValue LIMIT 1;

-- 27 Product sales contribution percentage
SELECT p.Name,
ROUND(SUM(od.Quantity*od.UnitPrice),2) Revenue,
ROUND(100*SUM(od.Quantity*od.UnitPrice)/(SELECT SUM(Quantity*UnitPrice) 
FROM OrderDetails),2) RevenuePct
FROM Products p
JOIN OrderDetails od ON p.ProductID=od.ProductID 
GROUP BY p.ProductID,p.Name 
ORDER BY RevenuePct DESC LIMIT 15;

-- 28 Category sales contribution percentage
SELECT c.CategoryName,
ROUND(SUM(od.Quantity*od.UnitPrice),2) Revenue,
ROUND(100*SUM(od.Quantity*od.UnitPrice)/(SELECT SUM(Quantity*UnitPrice)
FROM OrderDetails),2) RevenuePct
FROM Categories c
JOIN Products p ON c.CategoryID=p.CategoryID 
JOIN OrderDetails od ON p.ProductID=od.ProductID 
GROUP BY c.CategoryID,c.CategoryName 
ORDER BY RevenuePct DESC;

-- 29 Repeat customers
SELECT c.CustomerID,c.Name 
FROM Customers c
WHERE (SELECT COUNT(*) FROM Orders o WHERE o.CustomerID=c.CustomerID)>1
ORDER BY c.CustomerID;

-- 30 Customers with no orders
SELECT c.CustomerID,c.Name
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID=o.CustomerID 
WHERE o.OrderID IS NULL;

-- 31 Products with no reviews
SELECT p.ProductID,p.Name
FROM Products p
LEFT JOIN Reviews r ON p.ProductID=r.ProductID
WHERE r.ReviewID IS NULL;

-- 32 Customers with both orders and reviews
SELECT c.CustomerID,c.Name 
FROM Customers c
WHERE EXISTS (SELECT 1 FROM Orders o WHERE o.CustomerID=c.CustomerID) 
AND EXISTS (SELECT 1 FROM Reviews r WHERE r.CustomerID=c.CustomerID);

-- 33 Best selling product in each category
SELECT CategoryName,ProductName,UnitsSold
FROM (SELECT c.CategoryName,p.Name ProductName,SUM(od.Quantity) UnitsSold,
ROW_NUMBER() OVER(PARTITION BY c.CategoryID ORDER BY SUM(od.Quantity) DESC) rn
FROM Categories c
JOIN Products p ON c.CategoryID=p.CategoryID 
JOIN OrderDetails od ON p.ProductID=od.ProductID 
GROUP BY c.CategoryID,c.CategoryName,p.ProductID,p.Name) x WHERE rn=1;

-- 34 Top customer in each city by spend
SELECT City,Name,Spend 
FROM (SELECT c.City,c.Name,SUM(od.Quantity*od.UnitPrice) Spend,
ROW_NUMBER() OVER(PARTITION BY c.City ORDER BY SUM(od.Quantity*od.UnitPrice) DESC) rn 
FROM Customers c 
JOIN Orders o ON c.CustomerID=o.CustomerID 
JOIN OrderDetails od ON o.OrderID=od.OrderID 
GROUP BY c.City,c.CustomerID,c.Name) x WHERE rn=1;

-- 35 Units sold by category
SELECT c.CategoryName,SUM(od.Quantity) UnitsSold 
FROM Categories c
 JOIN Products p ON c.CategoryID=p.CategoryID 
 JOIN OrderDetails od ON p.ProductID=od.ProductID
 GROUP BY c.CategoryID,c.CategoryName 
 ORDER BY UnitsSold DESC;

-- 36 Average selling price by category
SELECT c.CategoryName,
ROUND(AVG(od.UnitPrice),2) AvgSellingPrice
FROM Categories c 
JOIN Products p ON c.CategoryID=p.CategoryID
JOIN OrderDetails od ON p.ProductID=od.ProductID 
GROUP BY c.CategoryID,c.CategoryName 
ORDER BY AvgSellingPrice DESC;

-- 37 Customers with orders in 2026
SELECT DISTINCT c.CustomerID,c.Name 
FROM Customers c 
JOIN Orders o ON c.CustomerID=o.CustomerID
WHERE YEAR(o.OrderDate)=2026 
ORDER BY c.CustomerID;

-- 38 Average basket quantity per order
SELECT ROUND(AVG(TotalQty),2) AvgItemsPerOrder
 FROM (SELECT o.OrderID,SUM(od.Quantity) TotalQty
 FROM Orders o 
 JOIN OrderDetails od ON o.OrderID=od.OrderID 
 GROUP BY o.OrderID) x;

-- 39 Latest order for each customer
SELECT c.Name,o.OrderID,o.OrderDate 
FROM Customers c 
JOIN Orders o ON c.CustomerID=o.CustomerID
WHERE o.OrderDate=(SELECT MAX(o2.OrderDate) 
FROM Orders o2 WHERE o2.CustomerID=o.CustomerID) 
ORDER BY o.OrderDate DESC;

-- 40 Most reviewed products
SELECT p.Name,
COUNT(r.ReviewID) ReviewCount,
ROUND(AVG(r.Rating),2) AvgRating 
FROM Products p 
JOIN Reviews r ON p.ProductID=r.ProductID 
GROUP BY p.ProductID,p.Name 
ORDER BY ReviewCount DESC LIMIT 10;

-- 41 Shipping performance by city
SELECT c.City,COUNT(s.ShippingID) Shipments,
ROUND(AVG(DATEDIFF(s.DeliveryDate,s.ShipDate)),2) AvgDeliveryDays 
FROM Customers c
JOIN Orders o ON c.CustomerID=o.CustomerID
JOIN Shipping s ON o.OrderID=s.OrderID
WHERE s.DeliveryDate IS NOT NULL
GROUP BY c.City ORDER BY AvgDeliveryDays;