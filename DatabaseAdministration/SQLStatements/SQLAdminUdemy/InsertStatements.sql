use MyFirstDB
go 


--insert my details to table studentinfo
insert into StudentInfo (RollNo, StudentName, StudentAge, StudentPhoneNumber, StudentCity) Values (10, 'Neo', 22, '781-292-2831', 'Joburg')

--Inserting multiple records
insert into StudentInfo (RollNo, StudentName, StudentAge, StudentPhoneNumber, StudentCity) Values (9, 'John', 24, '781-346-2811', 'Durban'), (11, 'Joe', 42, '627-287-2783', 'Cape Town'), (12,'Jane', 19, '280-192-1028', 'Port Elizabeth')

--Create a new table and insert values from another table into it
create table students (name varchar(50), age int)

insert students (name, age) 
select StudentName, StudentAge from StudentInfo

select * from students

--Created back up table of student info "inserting" the entirety of studentinfo into the new table
select * into student_bkp from StudentInfo

select * from student_bkp