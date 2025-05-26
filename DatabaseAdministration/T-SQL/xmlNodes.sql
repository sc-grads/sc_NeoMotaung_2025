select T2.Loc.query('.') from @x.nodes('/Shopping/ShoppingTrip') as T2(Loc) –Table(Column) –shreds xml into relational data
<ShoppingTrip ShoppingTripID="L1"><Item Cost="4">Apples</Item><Item Cost="2">Bananas</Item><Item Cost="3">Cherries</Item></ShoppingTrip>
<ShoppingTrip ShoppingTripID="L2"><Item>Diamonds</Item><Item>Emeralds</Item><Item>Furniture</Item></ShoppingTrip>
https://docs.microsoft.com/en-us/sql/t-sql/xml/nodes-method-xml-data-type  
select T2.Loc.value('@Cost','varchar(50)') 
from @x.nodes('/Shopping/ShoppingTrip/Item') as T2(Loc)
4
2
3
NULL
NULL
NULL

Create Table #tblXML
(pkXML INT PRIMARY KEY,
xmlCol XML)

declare @x xml  
set @x='<Shopping ShopperName="Phillip Burton" >  
<ShoppingTrip ShoppingTripID="L1" >  
  <Item Cost="5">Bananas</Item>  
  <Item Cost="4">Apples</Item>  
  <Item Cost="3">Cherries</Item>  
</ShoppingTrip>  
<ShoppingTrip ShoppingTripID="L2" >  
  <Item>Emeralds</Item>  
  <Item>Diamonds</Item>  
  <Item>Furniture</Item>  
</ShoppingTrip>  
</Shopping>'  

INSERT INTO #tblXML(pkXML, xmlCol)
VALUES (1, @x)

SELECT MyTable.ColXML.query('.')
FROM #tblXML
CROSS APPLY xmlCol.nodes('Shopping/ShoppingTrip') as MyTable(ColXML)

drop table #tblXML
go

<ShoppingTrip ShoppingTripID="L1"><Item Cost="5">Bananas</Item><Item Cost="4">Apples</Item><Item Cost="3">Cherries</Item></ShoppingTrip>
<ShoppingTrip ShoppingTripID="L2"><Item>Emeralds</Item><Item>Diamonds</Item><Item>Furniture</Item></ShoppingTrip>
SELECT MyTable.ColXML.value('@Cost','varchar(50)')
FROM #tblXML
CROSS APPLY xmlCol.nodes('Shopping/ShoppingTrip/Item') as MyTable(ColXML)

5
4
3
NULL
NULL
NULL
