select * from tblEmployee
where not EmployeeNumber > 200

select * from tblEmployee
where EmployeeNumber != 200

select * from tblEmployee
where EmployeeNumber >= 200 and EmployeeNumber <= 209

select * from tblEmployee
where not (EmployeeNumber>=200 and EmployeeNumber<=209)

select * from tblEmployee
where EmployeeNumber<200 or EmployeeNumber>209

select * from tblEmployee
where EmployeeNumber between 200 and 209

select * from tblEmployee
where EmployeeNumber in (200, 205, 208)