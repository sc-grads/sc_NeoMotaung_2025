--Database: SQLPractise
--Table: People
--Testing UPDATE Operation by changing the age value where ID = 1

UPDATE People
SET Age = 23
WHERE PersonID = 1;

SELECT * FROM People;