SELECT TOP (1000) [EmployeeNumber]
      ,[EmployeeFirstName]
      ,[EmployeeMiddleName]
      ,[EmployeeLastName]
      ,[EmployeeGovernmentID]
      ,[DateOfBirth]
      ,[Department],
	  case when left(EmployeeGovernmentID, 1) = 'A' then 'Letter A'
		   when EmployeeNumber < 200 then 'Less than 200'
		   else 'Neither letter' END + '.' as myCol
  FROM [70-461].[dbo].[tblEmployee]
