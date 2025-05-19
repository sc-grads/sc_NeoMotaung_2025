DECLARE @mynum AS DECIMAL(7,2) = 3.4643

SELECT POWER(@mynum, 3) AS Numbers 
SELECT SQUARE(@mynum) AS Numbers
SELECT POWER(@mynum, 0.5) AS Numbers
SELECT SQRT(@mynum) AS Numbers

SELECT FLOOR(@mynum) AS Flooring
SELECT CEILING(@mynum) AS CeilingVal
SELECT ROUND(@mynum, 1) AS Rounding

SELECT PI() AS Rounding
SELECT EXP(1) AS Rounding

SELECT SIGN(644) AS Signs

SELECT ABS(543) AS AbsolutePow
SELECT ABS(-543) AS AbsolutePow