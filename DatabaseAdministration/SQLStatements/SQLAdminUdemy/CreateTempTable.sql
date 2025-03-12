SELECT BusinessEntityID, FirstName, LastName
INTO #TempPeople
FROM [Person].[Person]
WHERE Title = 'Mr.';

SELECT * FROM #TempPeople;