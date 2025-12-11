drop table if exists Swiggy;

create table Swiggy (
sku_id SERIAL PRIMARY KEY,
OrderID	varchar (10),
CustomerID	varchar (10),
ProductID varchar (10),
ProductName	Char (50),
StoreID	varchar (10),
DeliveryPartnerID varchar (10),
OrderDate Timestamp,
DeliveryDate Timestamp,
UnitPrice INTEGER,
Quantity INTEGER,	
TotalPrice INTEGER,
DiscountApplied	Numeric (8,2),
DeliveryTimeMinutes INTEGER,
OrderStatus	char (10),
PaymentMethodID	varchar (10),
TimeOfDay char (10)
);

---To Check whole table
Select * From Swiggy;

---Data Exploration
--Count of rows
Select Count(*)from Swiggy;

--Required only 25 rows
Select * from Swiggy
Limit 25;

--Check null value of table
SELECT * FROM Swiggy
WHERE StoreID IS NULL
OR
ProductID IS NULL;


---Required ProductName order wise
Select distinct ProductName from Swiggy
order by ProductName; 


---OrderStatus wise TotalPrice
Select OrderStatus,sum (TotalPrice) as Price,Sum (Quantity)as Qnty from Swiggy
GROUP by OrderStatus; 

---TimeOfDay wise TotalPrice
Select TimeOfDay,sum (TotalPrice) as Price,Sum (Quantity)as Qnty from Swiggy
GROUP by TimeOfDay; 

--product names present multiple times
SELECT ProductID, COUNT(sku_id) AS "Number of SKUs"
FROM Swiggy
GROUP BY ProductID
HAVING count(sku_id) > 1
ORDER BY count(sku_id) DESC;

--data cleaning

--products with Quantity and TotalPrice = 0
SELECT * FROM Swiggy
WHERE Quantity = 0 OR TotalPrice = 0;

DELETE FROM Swiggy
WHERE Quantity = 0 OR TotalPrice = 0;


-- Q1. Find the top 10 best-value ProductName based on the DiscountApplied.
SELECT DISTINCT ProductName, UnitPrice, DiscountApplied
FROM Swiggy
ORDER BY DiscountApplied DESC
LIMIT 10;


--Q2. Find the Top 20 best-value products based on the DiscountApplied above 20.
SELECT DISTINCT ProductName, UnitPrice, DiscountApplied
FROM Swiggy
where DiscountApplied > 20
ORDER BY DiscountApplied DESC
LIMIT 20;

--Q3.Calculate Estimated Revenue for each ProductName
SELECT ProductName,
SUM(UnitPrice * Quantity) AS total_revenue
FROM Swiggy
GROUP BY ProductName
ORDER BY total_revenue Desc;

-- Q4. Find all ProductName where UnitPrice is greater than ₹300 and DiscountApplied is less than 1000.
SELECT DISTINCT ProductName, UnitPrice, DiscountApplied
FROM Swiggy
WHERE UnitPrice > 300 AND DiscountApplied < 1000
ORDER BY UnitPrice DESC, DiscountApplied DESC;

-- Q5. Identify the top 5 ProductName offering the highest average DiscountApplied.
SELECT ProductName,
ROUND(AVG(DiscountApplied),2) AS avg_discount --Round used for decemal
FROM Swiggy
GROUP BY ProductName
ORDER BY avg_discount DESC
LIMIT 10;

-- Q6. Find the price per Quantity for products above 5 and sort by best value.
SELECT DISTINCT ProductName, Quantity, DiscountApplied,
ROUND(DiscountApplied/Quantity,2) AS price_Qnty
FROM Swiggy
WHERE Quantity > 5
ORDER BY price_Qnty;

--Q7.Group the ProductName into DeliveryTimeMinutes like Low, Medium, Slow.
SELECT DISTINCT ProductName, OrderStatus,DeliveryTimeMinutes,
CASE WHEN DeliveryTimeMinutes < 10 THEN 'Fast'
	WHEN DeliveryTimeMinutes <  25 THEN 'Medium'
	ELSE 'Slow'
	END AS QuickDelivery
FROM Swiggy;

--Q8.What is the Total Price Per PaymentMethodID 
SELECT PaymentMethodID,
sum(UnitPrice * Quantity) AS total_Price
FROM Swiggy
GROUP BY PaymentMethodID
ORDER BY total_Price;

--Q9.What is the Total Price Per TimeOfDay 
SELECT TimeOfDay,
sum(UnitPrice * Quantity) AS total_Price
FROM Swiggy
GROUP BY TimeOfDay
ORDER BY total_Price;