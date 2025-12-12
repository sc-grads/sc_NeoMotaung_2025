USE AdventureWorks2022
GO



-- Question 1

SELECT * 
FROM HumanResources.Employee 
ORDER BY JobTitle ASC

-- Question 2

SELECT * 
FROM Person.Person AS employees 
ORDER BY LastName

-- Question 3

SELECT FirstName, LastName, BusinessEntityID AS Employee_id 
FROM Person.Person 
ORDER BY LastName ASC

-- Question 4

SELECT ProductID, ProductNumber, Name 
FROM Production.Product 
WHERE SellStartDate IS NOT NULL AND ProductLine = 'T' 
ORDER BY Name ASC

-- Question 5

SELECT SalesOrderID, CustomerID, OrderDate, SubTotal, TaxAmt/SubTotal * 100 AS tax_percent 
FROM Sales.SalesOrderHeader 
ORDER BY Subtotal ASC

-- Question 6

SELECT DISTINCT JobTitle 
FROM HumanResources.Employee 
ORDER BY JobTitle ASC

-- Question 7

SELECT CustomerID, SUM(Freight) AS total_freight 
FROM Sales.SalesOrderHeader 
GROUP BY CustomerID 
ORDER BY CustomerID ASC

-- Question 8

SELECT CustomerID, SalesPersonID, AVG(SubTotal) AS avg_subtotal, SUM(SubTotal) AS sum_subtotal 
FROM Sales.SalesOrderHeader 
GROUP BY CustomerID, SalesPersonID 
ORDER BY  CustomerID DESC

-- Question 9

SELECT ProductID, SUM(Quantity) AS total_quantity 
FROM production.ProductInventory 
WHERE Shelf IN ('A', 'C', 'H') 
GROUP BY ProductID
HAVING SUM(Quantity) >500
ORDER BY ProductID ASC

-- Question 10

SELECT SUM(Quantity) AS total_quantity 
FROM Production.ProductInventory 
GROUP BY LocationID


-- Question 11

SELECT p.BusinessEntityID, p.FirstName, p.LastName, ph.PhoneNumber 
FROM Person.Person AS p 
JOIN Person.PersonPhone AS ph 
ON p.BusinessEntityID = ph.BusinessEntityID
WHERE P.LastName LIKE 'L%'
ORDER BY p.LastName ASC, p.FirstName ASC 

-- Question 12

SELECT DISTINCT SalesPersonID, CustomerID, SUM(SubTotal) AS sum_subtotal -- OVER (ORDER BY SalesPersonID, CustomerID) AS sum_subtotal 
FROM Sales.SalesOrderHeader 
WHERE SalesPersonID IS NOT NULL 
GROUP BY SalesPersonID, CustomerID, SubTotal

-- Question 13

SELECT DISTINCT LocationID, Shelf, SUM(Quantity) AS totalquantity 
FROM production.ProductInventory 
GROUP BY locationID, Shelf

-- Question 14

SELECT DISTINCT LocationID, Shelf, SUM(Quantity) AS totalquantity 
FROM production.ProductInventory 
GROUP BY ROLLUP(locationID, Shelf)


-- Question 15

SELECT LocationID, SUM(Quantity) AS totalquantity 
FROM production.ProductInventory 
GROUP BY ROLLUP(locationID)

-- Question 16

SELECT addr.City, COUNT(*) AS noofemployees 
FROM Person.Address AS addr 
JOIN Person.BusinessEntityAddress AS bea
ON addr.AddressID = bea.AddressID
GROUP BY addr.City
ORDER BY addr.City ASC

-- Question 17

SELECT YEAR(OrderDate) AS Year, SUM(TotalDue) AS total_due_amount 
FROM Sales.SalesOrderHeader 
GROUP BY YEAR(OrderDate) 
ORDER BY YEAR(OrderDate)

-- Question 18

SELECT YEAR(OrderDate) AS Year, SUM(TotalDue) AS total_due_amount 
FROM Sales.SalesOrderHeader 
WHERE YEAR(OrderDate) < '2016' 
GROUP BY YEAR(OrderDate) 
ORDER BY YEAR(OrderDate)

-- Question 19

SELECT ContactTypeID, Name FROM Person.ContactType
WHERE name LIKE '%Manager%'
ORDER BY ContactTypeID DESC

-- Question 20

SELECT p.BusinessEntityID, p.LastName, p.FirstName 
FROM Person.ContactType AS ct
JOIN Person.BusinessEntityContact AS bec
ON ct.ContactTypeID = bec.ContactTypeID
JOIN Person.Person AS p
ON bec.BusinessEntityID = p.BusinessEntityID
WHERE ct.Name = 'Purchasing Manager'
ORDER BY p.LastName ASC, p.FirstName ASC

-- Selecting BusinessEntityID, LastName, and FirstName from multiple tables based on specified conditions
SELECT pp.BusinessEntityID, LastName, FirstName
    -- Retrieving BusinessEntityID, LastName, and FirstName columns
    FROM Person.BusinessEntityContact AS pb 
        -- Joining Person.BusinessEntityContact with Person.ContactType based on ContactTypeID
        INNER JOIN Person.ContactType AS pc
            ON pc.ContactTypeID = pb.ContactTypeID
        -- Joining Person.BusinessEntityContact with Person.Person based on BusinessEntityID
        INNER JOIN Person.Person AS pp
            ON pp.BusinessEntityID = pb.PersonID
    -- Filtering the results to include only records where the ContactType Name is 'Purchasing Manager'
    WHERE pc.Name = 'Purchasing Manager'
    -- Sorting the results by LastName and FirstName
    ORDER BY LastName, FirstName;


-- Question 21

SELECT ROW_NUMBER() OVER (PARTITION BY addr.PostalCode ORDER BY sp.SalesYTD DESC) AS Row_number, p.LastName, sp.SalesYTD, addr.PostalCode
FROM Sales.SalesPerson AS sp
JOIN Person.BusinessEntityAddress AS bea
ON sp.BusinessEntityID = bea.BusinessEntityID
JOIN Person.Address AS addr
ON addr.AddressID = bea.AddressID
JOIN Person.Person AS p
ON sp.BusinessEntityID = p.BusinessEntityID
WHERE sp.SalesYTD != 0
ORDER BY addr.PostalCode ASC

SELECT ROW_NUMBER() OVER(PARTITION BY pa.PostalCode ORDER BY sp.SalesYTD DESC) AS RowNumber, p.LastName, sp.SalesYTD, pa.PostalCode
FROM Sales.SalesPerson AS sp
JOIN Person.Person AS p 
ON sp.BusinessEntityID = p.BusinessEntityID
JOIN Person.BusinessEntityAddress AS bea 
ON bea.AddressID = p.BusinessEntityID
JOIN Person.Address AS pa 
ON pa.AddressID = bea.AddressID
ORDER BY pa.PostalCode ASC

-- Question 22

SELECT ct.ContactTypeID, Name, COUNT(bec.BusinessEntityID) AS nocontact 
FROM Person.ContactType AS ct
JOIN Person.BusinessEntityContact AS bec
ON ct.ContactTypeID = bec.ContactTypeID
GROUP BY ct.ContactTypeID, Name
HAVING COUNT(bec.BusinessEntityID) >=100
ORDER BY COUNT(*) DESC

-- Question 23

SELECT CONVERT(date, eph.RateChangeDate) AS fromdate, (p.LastName + ', ' + p.FirstName + ' ' + IsNull(p.MiddleName, '')) AS nameinfull, eph.Rate * 40 AS salaryinaweek 
FROM HumanResources.EmployeePayHistory AS eph
JOIN Person.Person AS p
ON eph.BusinessEntityID = p.BusinessEntityID
ORDER BY nameinfull ASC

-- Question 24

SELECT CONVERT(date, eph.RateChangeDate) AS fromdate, (p.LastName + ', ' + p.FirstName + ' ' + IsNull(p.MiddleName, '')) AS nameinfull, eph.Rate * 40 AS salaryinaweek 
FROM HumanResources.EmployeePayHistory AS eph
JOIN Person.Person AS p
ON eph.BusinessEntityID = p.BusinessEntityID
ORDER BY eph.RateChangeDate DESC, nameinfull ASC

-- Question 25

SELECT SalesOrderID, ProductID, OrderQty, SUM(OrderQty) AS total_quantity, AVG(OrderQty) AS average_quantity, COUNT(OrderQty) AS no_of_orders, MAX(OrderQty) AS max_quantoty, MIN(OrderQty) AS min_quantity 
FROM Sales.SalesOrderDetail 
WHERE SalesOrderID = 43659 OR SalesOrderID = 43664
GROUP BY SalesOrderID, ProductID, OrderQty