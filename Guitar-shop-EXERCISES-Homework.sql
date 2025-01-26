--CHAPTER 3
 -- EXERCISE 1 - return ProductCode, ProductName, ListPrice, DiscountPercent from Products
SELECT  ProductCode, ProductName, ListPrice, DiscountPercent
  FROM Products
  ORDER BY ListPrice DESC;

--EXERCISE 2 - return FullName alphabetical only m-z from Customers
SELECT (LastName + ', ' + FirstName) as FullName
  FROM Customers
  WHERE LastName LIKE '[M-Z]%'
  ORDER BY LastName;

--EXERCISE 3 - return ProductName, ListPrice, DateAdded - listprice between500 and 2000 - descending by dateadded from Poducts
SELECT ProductName, ListPrice, DateAdded
  FROM Products
  Where ListPrice Between 500 AND 2000
  ORDER BY DateAdded DESC;

-- Exercise 4 - return ProductName, ListPrice, DiscountPercent, DiscountAmount, DiscountPrice - descending by DiscountPrice from Products
SELECT ProductName, ListPrice, DiscountPercent,
       (ListPrice * (DiscountPercent/100)) AS DiscountAmount, 
	   (ListPrice - (ListPrice * (DiscountPercent/100))) AS DiscountPrice
  FROM Products
  ORDER BY DiscountPrice DESC;

--EXERCISE 5 - return ItemID, ItemPrice, DiscountAmount, Quantity, PriceTotal, DiscountTotal, ItemTotal - item total more than 500 descending from OrderItems 
SELECT ItemID, ItemPrice, DiscountAmount, Quantity, (ItemPrice * Quantity) AS PriceTotal, (DiscountAmount * Quantity) AS DiscountTotal,
       ((ItemPrice - DiscountAmount) * Quantity) AS ItemTotal
  FROM OrderItems
  WHERE ((ItemPrice - DiscountAmount) * Quantity) > 500
  ORDER BY ItemTotal DESC;

--EXERCISE 6 - return OrderID, OrderDate, ShipDate - rows that show no ship date from Orders
SELECT OrderID, OrderDate, ShipDate
  FROM Orders
  Where ShipDate IS NULL;

--EXERCISE 7 - return Price, TaxRate, TaxAmount, Total  - without FROM clause
SELECT 100 AS Price, .07 as TaxRate, (100 * .07) AS TaxAmount, (100 + (100 * .07)) as Total


--CHAPTER 4
-- EXERCISE ! - return CategoryName, ProductName, ListPrice - from Categories and Products tables - order by category, product ascending order
SELECT CategoryName, ProductName, ListPrice
  FROM Categories C
  JOIN Products P ON C.CategoryID = P.CategoryID
  ORDER BY CategoryName, ProductName;

--EXERCISE 2 - return FirstName, LastName, Line1, City, State, ZipCode - from Customers, Addresses - for allan.sherwood@yahoo.com
SELECT FirstName, LastName, Line1, City, State, ZipCode
  FROM Customers C
  JOIN Addresses A ON C.CustomerID = A.CustomerID
  WHERE EmailAddress = 'allan.sherwood@yahoo.com';

--EXERCISE 3 - return FirstName, LastName, Line1, City, State, ZipCode - from Customers, Addresses - only shipping addresses
SELECT FirstName, LastName, Line1, City, State, ZipCode
  FROM Customers C
  JOIN Addresses A ON C.CustomerID = A.CustomerID
  Where c.ShippingAddressID < c.BillingAddressID; - WRONG

SELECT *
  From Customers

SELECT *
  FROM Addresses

--EXERCISE 4 - return LastName, FirstName, OrderDate, ProductName, ItemPrice, DiscountAmount, Quantity - from Customers, orders, orderitems, product - sort Lastname, oderdate, productname 
SELECT LastName, FirstName, OrderDate, ProductName, ItemPrice, DiscountAmount, Quantity
  FROM Customers C
  JOIN Orders O ON C.CustomerID = O.CustomerID
  JOIN OrderItems OI ON O.OrderID = OI.OrderID
  JOIN Products P ON OI.ProductID = P.ProductID
  ORDER BY LastName, OrderDate, ProductName;

--EXERCISE 5 - return ProductName, ListPrice - from Products - one row for each product that has same price as another - sort by product name
SELECT p1.ProductName, p1.ListPrice
  FROM Products P1
  JOIN Products P2 ON P1.ListPrice = P2.ListPrice
  Order BY ProductName; - WRONG

--EXERCISE 6 - return CategoryName, ProductID - from Catagories, Products - 1 row for each category not used
SELECT CategoryName, ProductID
  FROM Categories C
  LEFT JOIN Products P ON C.CategoryID = P.CategoryID
  Where ProductID IS NULL;

