/*========================================================
Business Performance Analytics (SQL Portfolio Project)

Description:
An end-to-end SQL project built using MySQL to analyze
business performance data including customers, products,
orders, payments, shipping and returns.

========================================================*/

/*=======================================
Database Creation
=======================================*/
create database business_performance_analytics;
/*Use database*/
use business_performance_analytics;

/*=======================================
Table Creation
=======================================*/

/* Categories Table*/
create table categories (
category_id int primary key auto_increment,
category_name varchar(100) not null
);

/*Customers Table*/
create table customers(
customer_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50),
gender varchar(10),
city varchar(50),
state varchar(50),
signup_date date
);

/*Products Table*/
create table products(
product_id int primary key auto_increment,
product_name varchar(150) not null,
category_id int,
unit_price decimal(10,2),
cost_price decimal(10,2),
stock_quantity int,
foreign key(category_id) references categories(category_id)
);

/*Shipping Table*/
create table shipping(
shipping_id int primary key auto_increment,
shipping_partner varchar(100),
dispatch_date date,
delivery_date date,
shipping_cost decimal(10,2)
);

/* Orders Table*/
create table orders(
order_id int primary key auto_increment,
customer_id int,
order_date date,
order_status varchar(30),
shipping_id int,
foreign key (customer_id) references customers(customer_id),
foreign key (shipping_id) references shipping(shipping_id)
);

/*Order_items Table*/
create table order_items(
order_item_id int primary key auto_increment,
order_id int,
product_id int,
quantity int,
selling_price decimal(10,2),
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);

/*Payments Table*/
create table payments(
payment_id int primary key auto_increment,
order_id int,
payment_method varchar(50),
payment_amount decimal(10,2),
payment_date date,
foreign key(order_id) references orders(order_id)
);

/*Returns Table*/
create table returns(
return_id int primary key auto_increment,
order_id int,
return_date date,
return_reason varchar(225),
refund_amount decimal(10,2),
foreign key(order_id) references orders(order_id)
);

/*=======================================
Data Insertion
=======================================*/

/* insert categories*/
insert into categories (category_name) values ('Electronics'),('Clothing'),('Home & Kitchen'), ('Beauty'),('Sports');

/* insert products*/
insert into products (product_name,category_id,unit_price,cost_price,stock_quantity) values
('Samsung Galaxy S24',1,74999,68000,50),
('Apple AirPods',1,24999,22000,40),
('Nike Running Shoes',5,5999,4200,100),
('Puma T-Shirt',2,1499,900,200),
('Prestige Pressure Cooker',3,3499,2500,60),
('Philips Trimmer',1,2499,1800,70),
('Lakme Face Wash',4,299,180,300),
('Yoga Mat',5,999,600,150),
('Bedsheet Set',3,1299,850,100),
('Levis Jeans',2,2999,1900,80);

/* insert customers*/
insert into customers(first_name, last_name, gender, city,state, signup_date) values
('Aarav','Sharma','Male','Mumbai','Maharashtra','2025-01-15'),
('Ananya','Patel','Female','Ahmedabad','Gujarat','2025-01-20'),
('Vihaan','Singh','Male','Delhi','Delhi','2025-02-01'),
('Diya','Iyer','Female','Chennai','Tamil Nadu','2025-02-05'),
('Aditya','Verma','Male','Pune','Maharashtra','2025-02-10'),
('Isha','Gupta','Female','Bengaluru','Karnataka','2025-02-15'),
('Arjun','Nair','Male','Kochi','Kerala','2025-02-20'),
('Meera','Joshi','Female','Nagpur','Maharashtra','2025-02-25'),
('Rohan','Kapoor','Male','Delhi','Delhi','2025-03-01'),
('Sneha','Reddy','Female','Hyderabad','Telangana','2025-03-05'),
('Kabir','Mehta','Male','Surat','Gujarat','2025-03-10'),
('Priya','Menon','Female','Thiruvananthapuram','Kerala','2025-03-15'),
('Yash','Desai','Male','Vadodara','Gujarat','2025-03-20'),
('Pooja','Kulkarni','Female','Mumbai','Maharashtra','2025-03-25'),
('Karan','Malhotra','Male','Chandigarh','Punjab','2025-04-01'),
('Neha','Agarwal','Female','Jaipur','Rajasthan','2025-04-05'),
('Rahul','Mishra','Male','Lucknow','Uttar Pradesh','2025-04-10'),
('Aditi','Bose','Female','Kolkata','West Bengal','2025-04-15'),
('Manav','Saxena','Male','Indore','Madhya Pradesh','2025-04-20'),
('Riya','Shah','Female','Mumbai','Maharashtra','2025-04-25');

/* insert shipping*/
insert into shipping (shipping_partner, dispatch_date, delivery_date, shipping_cost) values
('Delhivery','2025-05-02','2025-05-05',80),
('Blue Dart','2025-05-03','2025-05-06',120),
('Ekart','2025-05-04','2025-05-07',60),
('XpressBees','2025-05-05','2025-05-08',90),
('Ecom Express','2025-05-06','2025-05-09',75),
('Delhivery','2025-05-07','2025-05-10',80),
('Blue Dart','2025-05-08','2025-05-11',120),
('Ekart','2025-05-09','2025-05-12',60),
('XpressBees','2025-05-10','2025-05-13',90),
('Ecom Express','2025-05-11','2025-05-14',75);


/* insert orders*/
insert into orders (customer_id, order_date, order_status, shipping_id) values
(1,'2025-05-02','Delivered',1),
(2,'2025-05-03','Delivered',2),
(3,'2025-05-03','Delivered',3),
(4,'2025-05-04','Processing',4),
(5,'2025-05-04','Delivered',5),
(6,'2025-05-05','Delivered',6),
(7,'2025-05-05','Cancelled',7),
(8,'2025-05-06','Delivered',8),
(9,'2025-05-06','Processing',9),
(10,'2025-05-07','Delivered',10),
(11,'2025-05-07','Delivered',1),
(12,'2025-05-08','Delivered',2),
(13,'2025-05-08','Processing',3),
(14,'2025-05-09','Delivered',4),
(15,'2025-05-09','Delivered',5),
(16,'2025-05-10','Cancelled',6),
(17,'2025-05-10','Delivered',7),
(18,'2025-05-11','Delivered',8),
(19,'2025-05-11','Processing',9),
(20,'2025-05-12','Delivered',10),
(1,'2025-05-15','Delivered',1),
(3,'2025-05-16','Delivered',2),
(5,'2025-05-17','Delivered',3),
(8,'2025-05-18','Processing',4),
(10,'2025-05-19','Delivered',5),
(12,'2025-05-20','Delivered',6),
(14,'2025-05-21','Delivered',7),
(16,'2025-05-22','Cancelled',8),
(18,'2025-05-23','Delivered',9),
(20,'2025-05-24','Delivered',10);

/*insert order_items*/
insert into order_items
(order_id, product_id, quantity, selling_price) values
(1,1,1,74999),
(1,8,2,999),
(2,2,1,24999),
(3,3,1,5999),
(3,7,2,299),
(4,4,2,1499),
(5,5,1,3499),
(6,6,1,2499),
(6,8,1,999),
(7,10,1,2999),
(8,1,1,74999),
(9,3,2,5999),
(10,2,1,24999),
(10,9,1,1299),
(11,7,3,299),
(12,4,1,1499),
(13,5,1,3499),
(14,6,2,2499),
(15,10,1,2999),
(16,8,2,999),
(17,3,1,5999),
(18,1,1,74999),
(18,7,1,299),
(19,2,1,24999),
(20,9,2,1299),
(21,4,1,1499),
(22,5,1,3499),
(23,6,1,2499),
(24,8,1,999);

/* Inserting Payments data*/
insert into payments
(order_id, payment_method, payment_amount, payment_date) values
(1,'UPI',76997,'2025-05-02'),
(2,'Credit Card',24999,'2025-05-03'),
(3,'Debit Card',6597,'2025-05-03'),
(4,'UPI',2998,'2025-05-04'),
(5,'Net Banking',3499,'2025-05-04'),
(6,'UPI',3498,'2025-05-05'),
(7,'Credit Card',2999,'2025-05-05'),
(8,'UPI',74999,'2025-05-06'),
(9,'Debit Card',11998,'2025-05-06'),
(10,'UPI',26298,'2025-05-07'),
(11,'UPI',897,'2025-05-07'),
(12,'Credit Card',1499,'2025-05-08'),
(13,'Net Banking',3499,'2025-05-08'),
(14,'UPI',4998,'2025-05-09'),
(15,'Debit Card',2999,'2025-05-09'),
(16,'UPI',1998,'2025-05-10'),
(17,'Credit Card',5999,'2025-05-10'),
(18,'UPI',75298,'2025-05-11'),
(19,'Debit Card',24999,'2025-05-11'),
(20,'UPI',2598,'2025-05-12');

/* inserting returns data*/
insert into returns (order_id, return_date, return_reason, refund_amount) values
(3,'2025-05-10','Damaged Product',6597),
(7,'2025-05-12','Wrong Size',2999),
(12,'2025-05-15','Changed Mind',1499),
(16,'2025-05-18','Defective Product',1998),
(19,'2025-05-19','Damaged Product',24999),
(24,'2025-05-20','Wrong Item Received',999),
(28,'2025-05-22','Changed Mind',3499),
(35,'2025-05-25','Defective Product',5999);

/*=======================================
Business Questions
=======================================*/
/*How many customers do we have?*/
select count(customer_id) as total_customers from customers;

/*How many products do we sell?*/
select count(product_id) as total_products from products;

/*How many orders were placed?*/
select count(order_id) as total_orders from orders;

/*How many payment methods do we have?*/
select count(distinct(payment_method)) as total_payment_methods from payments;

/*Which cities do our customers belong to?*/
select distinct(city) from customers;

/*Customers per city*/
select city, count(customer_id) as total_customer_per_city from customers group by city;

/*Orders by status*/
select order_status, count(order_id) as total_orders from orders group by order_status;

/*Products per category*/
select c.category_name ,count(p.product_id) as total_products
from Products as p 
inner join Categories as c
on p.category_id= c.category_id
group by category_name;

/*Revenue by payment method*/
select  payment_method, sum(payment_amount) as total_revenue from payments
group by payment_method;

/*Return reasons count*/
select return_reason,count(return_reason) as total_returns from returns group by return_reason;

/*Which city has the highest number of customers*/
select city, count(customer_id) as no_of_customers from customers
group by city
order by no_of_customers desc limit 1;

/*Customer Order History*/
select concat(c.first_name,' ',c.last_name) as customer_name, o.order_date,o.order_status from customers as c
inner join orders as o
on c.customer_id = o.customer_id;

/*Product Purchase Details*/
select p.product_name as product_name, o.quantity as quantity, o.selling_price as selling_price 
from products as p 
inner join order_items as o
on p.product_id=o.product_id;

/* Units sold per product */
select p.product_name,SUM(o.quantity) AS total_quantity_sold from products p
inner join order_items o
on p.product_id = o.product_id
group by p.product_name
order by total_quantity_sold DESC;

/*Show category-wise revenue.*/
select c.category_name,sum(o.quantity*o.selling_price) as total_revenue from categories as c
inner join products p 
on c.category_id=p.category_id
inner join order_items o
on p.product_id=o.product_id
group by c.category_name
order by total_revenue desc;

/*Show total amount spent by each customer.*/
select concat(c.first_name,' ',c.last_name) as customer_name,sum(p.payment_amount) as total_spent
from customers c
inner join orders o
on c.customer_id= o.customer_id
inner join payments p
on o.order_id=p.order_id
group by customer_name
order by total_spent desc;

/*Which 5 customers have spent the most money*/
select concat(c.first_name,' ',c.last_name) as customer_name,sum(p.payment_amount) as total_spent
from customers c
inner join orders o
on c.customer_id= o.customer_id
inner join payments p
on o.order_id=p.order_id
group by customer_name
order by total_spent desc
limit 5;

/*Rank customers from highest spender to lowest spender.*/
Select concat(c.first_name,' ',c.last_name) AS customer_name,sum(p.payment_amount) AS total_spent,
rank() over(
	order by sum(p.payment_amount) desc
    ) as customer_rank
from customers c
inner join orders o
on c.customer_id = o.customer_id
inner join payments p
on o.order_id = p.order_id
group by
    c.customer_id,
    c.first_name,
    c.last_name
order by customer_rank;
