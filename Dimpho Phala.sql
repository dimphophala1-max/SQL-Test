--QUESTION 1
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Suppliers;

--QUESTION 2 
SELECT ContactName
FROM Customers
WHERE ContactTitle LIKE '%Manager%'
ORDER BY ContactName ASC;

--QUESTION 3
SELECT *
FROM Orders
WHERE OrderDate >= '1997-05-19'
  AND OrderDate <  '1997-05-20';

--QUESTION 4
SELECT CompanyName, Fax, Phone, Country, HomePage
FROM Suppliers
ORDER BY Country DESC, CompanyName ASC;

--QUESTION 5
SELECT ProductName, UnitPrice, QuantityPerUnit
FROM Products
WHERE UnitsInStock = 0;

--QUESTION 6
SELECT ContactName, Address, City
FROM Customers
WHERE Country NOT IN ('Germany', 'Mexico', 'Spain');

--QUESTION 7
SELECT AVG(UnitPrice) AS AveragePrice,
       MIN(UnitPrice) AS MinimumPrice,
       MAX(UnitPrice) AS MaximumPrice
FROM Products;

--QUESTION 8
SELECT FirstName, LastName
FROM Employees
WHERE ReportsTo IS NULL;

--QUESTION 9
SELECT ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
FROM Orders
WHERE ShipPostalCode LIKE '98124%';

--QUESTION 10
SELECT LastName, FirstName, City
FROM Employees
WHERE City <> 'Seattle';

--QUESTION 11
SELECT ContactName, ContactTitle, CompanyName
FROM Customers
WHERE ContactTitle NOT LIKE '%Sales%';

--QUESTION 12
SELECT CustomerID, SUM(Freight) AS SumOfFreight
FROM Orders
GROUP BY CustomerID
HAVING SUM(Freight) > 200;

--QUESTION 13
SELECT s.SupplierID, s.CompanyName, c.CategoryName, p.ProductName, p.UnitPrice
FROM Products AS p
INNER JOIN Suppliers AS s ON p.SupplierID = s.SupplierID
INNER JOIN Categories AS c ON p.CategoryID = c.CategoryID;

--QUESTION 14
SELECT o.OrderID, e.FirstName, e.LastName
FROM Orders AS o
INNER JOIN Employees AS e ON o.EmployeeID = e.EmployeeID
WHERE o.ShippedDate > o.RequiredDate;

--QUESTION 15
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM [Order Details]
GROUP BY ProductID
HAVING SUM(Quantity) < 200;

--QUESTION 16
SELECT CustomerID, COUNT(*) AS TotalOrders
FROM Orders
WHERE OrderDate >= '1996-12-31'
GROUP BY CustomerID
HAVING COUNT(*) > 15;

--QUESTION 17
SELECT p.ProductName, p.UnitPrice, s.CompanyName
FROM Products AS p
INNER JOIN Suppliers AS s ON p.SupplierID = s.SupplierID;

--QUESTION 18
SELECT p.ProductName,
       SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalCosts
FROM [Order Details] AS od
INNER JOIN Products AS p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) > 200;

--QUESTION 19
SELECT OrderID, COUNT(OrderID) AS NumberofOrders
FROM [Order Details]
GROUP BY OrderID
ORDER BY NumberofOrders DESC;

--QUESTION 20
SELECT s.SupplierID, p.ProductName, s.CompanyName
FROM Products AS p
INNER JOIN Suppliers AS s ON p.SupplierID = s.SupplierID
WHERE s.CompanyName IN ('Exotic Liquids',
                        'Specialty Biscuits, Ltd.',
                        'Escargots Nouveaux')
ORDER BY s.SupplierID;
