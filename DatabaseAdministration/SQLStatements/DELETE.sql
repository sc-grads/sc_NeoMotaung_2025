--Database: SQLPractise
--Table: People
--Using delete operation, delete record where firstname = neo

--Before
SELECT * FROM People;

DELETE FROM People WHERE FirstName = 'Neo';

--After
SELECT * FROM People;