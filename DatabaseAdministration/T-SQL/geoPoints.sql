BEGIN TRAN
CREATE TABLE tblGeom
( GXY geometry,
Description varchar(30),
IDtblGeom int CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(1,1)
)
INSERT INTO tblGeom
VALUES (geometry::STGeomFromText('POINT (3 4)', 0),'First Point'), --0 IS MRDE
	   (geometry::STGeomFromText('POINT (3 5)', 0),'Second Point'),
	   (geometry::Point(4, 6, 0), 'Third Point'),
	   (geometry::STGeomFromText('MULTIPOINT ((3 4), (1 2), (3 4))', 0),'Three Points')

SELECT * FROM tblGeom

ROLLBACK TRAN