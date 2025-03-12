use MyFirstDB
go

SELECT * FROM StudentInfo s
join CourseInfo c
on s.RollNo = c.RollNo

SELECT * FROM StudentInfo s
left join CourseInfo c
on s.RollNo = c.RollNo

SELECT * FROM StudentInfo s
right join CourseInfo c
on s.RollNo = c.RollNo

