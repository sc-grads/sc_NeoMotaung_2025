bcp [70-461S3].dbo.tblDepartment out a-wn.out -N -T 

CREATE TABLE [dbo].[tblDepartment2](
	[Department] [varchar](19) NULL,
	[DepartmentHead] [varchar](19) NULL
)

GO

bcp [70-461S3].dbo.tblDepartment2 in a-wn.out -N -T 
drop table [dbo].[tblDepartment2]

DROP TABLE #tblXML
GO
CREATE TABLE #tblXML (XmlCol xml);  
GO


BULK INSERT #tblXML FROM 'c:\SampleFolder\SampleData4.txt'
select * from #tblXML
•	INSERT ... SELECT * FROM OPENROWSET(BULK...)

CREATE TABLE #tblXML (IntCol int, XmlCol xml);  
GO

INSERT INTO #tblXML(XmlCol)  
SELECT * FROM OPENROWSET(  
   BULK 'c:\SampleFolder\SampleData3.txt',  
   SINGLE_BLOB) AS x; --Binary Large Object (BLOB)

select * from #tblXML
