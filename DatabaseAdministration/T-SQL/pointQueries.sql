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

select IDtblGeom, GXY.STGeometryType() as MyType,
GXY.STStartPoint().ToString() as StartingPoint,
GXY.STEndPoint().ToString() as EndingPoint,
GXY.STPointN(1).ToString() as FirstPoint,
GXY.STPointN(2).ToString() as SecondPoint,
GXY.STPointN(1).STX as FirstPointX,
GXY.STPointN(1).STY as FirstPointY,
GXY.STNumPoints() as NumberPoints
from tblGeom

--ROLLBACK TRAN

declare @g as geometry
declare @h as geometry

select @g = GXY from tblGeom where IDtblGeom = 1
select @h = GXY from tblGeom where IDtblGeom = 3
select @g.STDistance(@h) as MyDistance

select @g
union all
select @h

rollback tran