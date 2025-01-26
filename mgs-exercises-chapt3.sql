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