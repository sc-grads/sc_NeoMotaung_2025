Use AdventureWorks2022
Go

-- problems: 26, 27, 

-- Question 26

SELECT SalesOrderID, ProductID, OrderQty, SUM(OrderQty), AVG(OrderQty), COUNT(OrderQty) OVER (PARTITION BY SalesOrderID)
FROM Sales.SalesOrderDetail
WHERE (SalesOrderID = 43659 OR SalesOrderID = 43664) AND (ProductID >= 710 AND ProductID < 720)
GROUP BY SalesOrderID, ProductID, OrderQty

SELECT
    sod.SalesOrderID AS ordernumber,
    sod.ProductID,
    sod.OrderQty AS quantity,

    -- Running total of quantities for this order
    SUM(sod.OrderQty) 
        OVER (PARTITION BY sod.SalesOrderID ORDER BY sod.ProductID) AS total,

    -- Running average of quantities for this order
    AVG(sod.OrderQty) 
        OVER (PARTITION BY sod.SalesOrderID ORDER BY sod.ProductID) AS avg,

    -- Running count of items for this order
    COUNT(*) 
        OVER (PARTITION BY sod.SalesOrderID ORDER BY sod.ProductID) AS count
FROM Sales.SalesOrderDetail AS sod
WHERE sod.SalesOrderID IN (43659, 43664)     -- match your example
ORDER BY sod.SalesOrderID, sod.ProductID;


--select * from sales.SalesOrderDetail

--select * from sales.SalesOrderDetail
--where SalesOrderID = 43659 and ProductID = 712

-- Question 27

SELECT SalesOrderID, SUM(SubTotal) AS totalcost
FROM Sales.SalesOrderHeader
GROUP BY SalesOrderID
HAVING SUM(SubTotal) > 100000

-- Question 28

SELECT ProductID, Name 
FROM Production.Product
WHERE Name LIKE 'Lock Washer%'
ORDER BY ProductID ASC

-- Question 29

SELECT ProductID, Name, Color
FROM Production.Product
ORDER BY ListPrice

-- Question 30

SELECT BusinessEntityID, JobTitle, HireDate 
FROM HumanResources.Employee
ORDER BY YEAR(HireDate)

-- Question 31

SELECT LastName, FirstName
FROM Person.Person
WHERE LastName LIKE 'R%'
ORDER BY FirstName ASC, LastName DESC

-- Question 32

SELECT BusinessEntityID,
       SalariedFlag
FROM HumanResources.Employee
ORDER BY 
    --SalariedFlag DESC,  -- true rows first (optional)
	CASE 
        WHEN SalariedFlag = 0 THEN BusinessEntityID 
    END ASC,
    CASE 
        WHEN SalariedFlag = 1 THEN BusinessEntityID 
    END DESC;
    

-- Question 33

select sp.BusinessEntityID, p.LastName, st.Name, cr.Name FROM sales.SalesPerson AS sp
JOIN sales.SalesTerritory AS st
ON sp.TerritoryID = st.TerritoryID
JOIN person.Person AS p
ON sp.BusinessEntityID = p.BusinessEntityID
JOIN person.CountryRegion AS cr
ON st.CountryRegionCode = cr.CountryRegionCode
ORDER BY
    CASE 
        WHEN cr.Name = 'United States' THEN st.Name
        ELSE cr.Name
    END;

-- Question 34

select p.FirstName, p.LastName, ROW_NUMBER() OVER (ORDER BY addr.PostalCode) AS 'Row Number', 
	RANK() OVER (ORDER BY addr.PostalCode) AS 'Rank', DENSE_RANK() OVER (ORDER BY addr.PostalCode) AS 'Dense Rank', 
	NTILE(4) OVER (ORDER BY addr.PostalCode) AS 'Quartile', sp.SalesYTD,
	addr.PostalCode
FROM Person.Person AS p
JOIN sales.SalesPerson AS sp
ON p.BusinessEntityID = sp.BusinessEntityID
JOIN sales.SalesTerritory AS st
ON sp.TerritoryID = st.TerritoryID
JOIN person.BusinessEntityAddress AS bea
ON p.BusinessEntityID = bea.AddressID
JOIN person.Address AS addr
ON bea.AddressID = addr.AddressID
ORDER BY addr.PostalCode

-- Question 35

SELECT * FROM HumanResources.Department
WHERE DepartmentID > 10


-- Question 36

SELECT TOP(5) * FROM HumanResources.Department
WHERE DepartmentID > 5

-- Question 37

SELECT Name, Color, ListPrice FROM Production.Product
WHERE Color IN ('Red', 'Blue')
ORDER BY ListPrice

-- Question 38

SELECT p.Name, sod.SalesOrderID FROM Sales.SalesOrderDetail AS sod
FULL JOIN Production.Product as p
ON sod.ProductID = p.ProductID
ORDER BY p.Name

-- Question 39

SELECT p.Name, sod.SalesOrderID FROM Sales.SalesOrderDetail AS sod
RIGHT JOIN Production.Product as p
ON sod.ProductID = p.ProductID
ORDER BY p.Name

-- Question 40

SELECT p.Name, sod.SalesOrderID FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product as p
ON sod.ProductID = p.ProductID
ORDER BY p.Name

-- Question 41

SELECT st.Name, sp.BusinessEntityID FROM Sales.SalesPerson AS sp
LEFT JOIN Sales.SalesTerritory AS st
ON sp.TerritoryID = st.TerritoryID

-- Question 42

SELECT (p.FirstName + ' ' + p.LastName) as name, addr.City FROM Person.Person AS p
JOIN Person.BusinessEntityAddress AS bea
ON p.BusinessEntityID = bea.BusinessEntityID
JOIN Person.Address AS addr
ON bea.AddressID = addr.AddressID
ORDER BY p.LastName, p.FirstName

-- Question 43

SELECT BusinessEntityID, FirstName, LastName FROM Person.Person 
WHERE LastName = 'Adams' AND PersonType = 'IN'
ORDER BY FirstName

-- Question 44

SELECT BusinessEntityID, FirstName, LastName FROM Person.Person 
WHERE LastName LIKE 'Al%' AND FirstName LIKE 'M%' AND BusinessEntityID < 1500

-- Question 45

SELECT ProductID, Name, Color FROM
	(
		SELECT *
		FROM Production.Product
	)
AS products
WHERE Name IN ('Blade', 'Crown Race', 'AWC Logo Cap')

-- Question 46

SELECT soh. FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesPerson AS sp
ON soh.SalesPersonID = sp.BusinessEntityID
GROUP BY YEAR(soh.OrderDate)

SELECT SalesPersonID, COUNT(SalesOrderID) as totalsales, YEAR(OrderDate) as salesyear
FROM sales.SalesOrderHeader
GROUP BY SalesPersonID, YEAR(OrderDate)
ORDER BY SalesPersonID, YEAR(OrderDate) ASC

-- Question 47

SELECT 
    AVG(OrderCount * 1.0) AS Average_Sales_Per_Person
FROM (
        SELECT 
            soh.SalesPersonID,
            COUNT(*) AS OrderCount
        FROM Sales.SalesOrderHeader AS soh
        WHERE soh.SalesPersonID IS NOT NULL       -- only sales reps
        GROUP BY soh.SalesPersonID
) AS SalesPerPerson;

-- Question 48

SELECT * FROM Production.ProductPhoto
WHERE LargePhotoFileName LIKE '%green_%'

-- Question 49

SELECT addr.AddressLine1, addr.AddressLine2, addr.City, addr.PostalCode, st.CountryRegionCode 
FROM Sales.SalesTerritory AS st
JOIN Person.BusinessEntityAddress AS bea
ON st.TerritoryID = bea.BusinessEntityID
JOIN Person.Address AS addr
ON bea.AddressID = addr.AddressID
WHERE st.CountryRegionCode != 'US' AND City LIKE 'Pa%'

SELECT addr.AddressLine1 AS addressline1, addr.AddressLine2 AS addressline2, addr.City, addr.PostalCode AS postalcode, cr.CountryRegionCode AS countryregioncode
FROM Person.Address AS addr
JOIN Person.StateProvince AS sp
ON addr.StateProvinceID = sp.StateProvinceID
JOIN Person.CountryRegion AS cr
ON sp.CountryRegionCode = cr.CountryRegionCode
WHERE cr.CountryRegionCode != 'US' AND City LIKE 'Pa%'


-- Question 50

SELECT TOP (20) JobTitle, HireDate 
FROM HumanResources.Employee
ORDER BY HireDate DESC

