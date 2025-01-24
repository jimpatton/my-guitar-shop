SELECT *
  FROM Categories;
SELECT *
  FROM Products;
-- Exercise 4
SELECT ProductName, ListPrice, DiscountPercent,
       (ListPrice * (DiscountPercent/100)) AS DiscountAmount, 
	   (ListPrice - (ListPrice * (DiscountPercent/100))) AS DiscountPrice
  FROM Products
  Order BY DiscountPrice DESC;
