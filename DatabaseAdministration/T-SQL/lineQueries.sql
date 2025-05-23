BEGIN TRAN
CREATE TABLE tblGeom
( GXY geometry,
Description varchar(30),
IDtblGeom int CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(1,1)
)
INSERT INTO tblGeom
VALUES (geometry::STGeomFromText('LINESTRING (1 1, 5 5)', 0), 'First Line'),
	   (geometry::STGeomFromText('LINESTRING (5 1, 1 4, 2 5, 5 1)', 0), 'Second Line'),
	   (geometry::STGeomFromText('MULTILINESTRING ((1 5, 2 6), (1 4, 2 5))', 0), 'Third Line'),
	   (geometry::STGeomFromText('POLYGON ((4 1, 6 3, 8 3, 6 1, 4 1))', 0), 'Polygon'),
	   (geometry::STGeomFromText('CIRCULARSTRING (1 0, 0 1, -1 0, 0 -1, 1 0)', 0), 'Circle')

SELECT * FROM tblGeom

select IDtblGeom, GXY.STGeometryType() as MyType,
GXY.STStartPoint().ToString() as StartingPoint,
GXY.STEndPoint().ToString() as EndingPoint,
GXY.STPointN(1).ToString() as FirstPoint,
GXY.STPointN(2).ToString() as SecondPoint,
GXY.STPointN(1).STX as FirstPointX,
GXY.STPointN(1).STY as FirstPointY,
GXY.STBoundary().ToString() as Boundary,
GXY.STLength() as MyLength,
GXY.STNumPoints() as NumberPoints
from tblGeom

--ROLLBACK TRAN

declare @g as geometry
select @g = GXY from tblGeom where IDtblGeom = 5

select IDtblGeom, GXY.STIntersection(@g).ToString() as Intersection,
GXY.STDistance(@g) as DistanceFromFirstLine
from tblGeom

SELECT GXY.STUnion(@g)
from tblGeom
where IDtblGeom = 8



rollback tran