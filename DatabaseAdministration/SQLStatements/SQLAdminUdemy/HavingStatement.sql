use AdventureWorks2022
go

SELECT count(*) As PersonTypeCount, PersonType FROM [Person].Person GROUP BY PersonType Having PersonType = 'EM' or PersonType = 'SC'