

begin tran
create table tblGeom
(
GXY geometry,
Description varchar(30),
IDtblGeom int CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(5,1)
)
INSERT INTO tblGeom
VALUES (geometry::STGeomFromText('LINESTRING (1 1, 5 5)', 0), 'First Line'),
	   (geometry::STGeomFromText('LINESTRING (5 1, 1 4, 2 5, 5 1)', 0), 'Second Line'),
	   (geometry::STGeomFromText('MULTILINESTRING ((1 5, 2 6), (1 4, 2 5))', 0), 'Third Line'),
	   (geometry::STGeomFromText('POLYGON ((4 1, 6 3, 8 3, 6 1, 4 1))', 0), 'Polygon'),
	   (geometry::STGeomFromText('POLYGON ((5 2, 7 2, 7 4, 5 4, 5 2))', 0), 'Second Polygon'),
	   (geometry::STGeomFromText('CIRCULARSTRING (1 0, 0 1, -1 0, 0 -1, 1 0)', 0), 'Circle')

SELECT * FROM tblGeom
WHERE GXY.Filter(geometry::Parse('POLYGON((2 1, 1 4, 4 4, 4 1, 2 1))')) = 1
DECLARE @i as geometry
select @i = geometry::UnionAggregate(GXY)
FROM TBLGeom

seLect @i as combinedshapes
  
declare @j as geometry
select @j = geometry::CollectionAggregate(GXY)
from tblGeom

select @j

select @i as CombinedShapes
--union all
select geometry::EnvelopeAggregate(GXY).ToString() as Envelop from tblGeom
--union all
select geometry::ConvexHullAggregate(GXY).ToString() as Envelop from tblGeom

rollback tran