USE [AdventureWorks2022]
GO

/****** Object:  View [dbo].[EmployeeNumbers]  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[EmployeeNumbers]
AS
SELECT Person.Person.FirstName, Person.Person.LastName, Person.PersonPhone.PhoneNumber, Person.PhoneNumberType.Name AS NumberType
FROM     Person.Person INNER JOIN
                  Person.PersonPhone ON Person.Person.BusinessEntityID = Person.PersonPhone.BusinessEntityID INNER JOIN
                  Person.PhoneNumberType ON Person.PersonPhone.PhoneNumberTypeID = Person.PhoneNumberType.PhoneNumberTypeID
WHERE  (Person.PhoneNumberType.Name = N'Cell')
GO