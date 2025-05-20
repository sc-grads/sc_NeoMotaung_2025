select * from tblEmployee
where DateOfBirth between '19760101' and '19861231'

select * from tblEmployee
where DateOfBirth >= '19760101' and DateOfBirth < '19870101'

--Using calculated values for comparisons is considered a bad idea
select * from tblEmployee
where year(DateOfBirth) between 1976 and 1986

--aggregate function
SELECT YEAR(DateOfBirth) as YearDOB, count(*) as Number 
FROM tblEmployee
Group by year(DateOfBirth)