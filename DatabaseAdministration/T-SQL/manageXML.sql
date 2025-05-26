select P.ProductID, P.Name, S.Name as SubcategoryName
from [Production].[Product] as P
left join [Production].[ProductSubcategory] as S
on P.ProductSubcategoryID = S.ProductSubcategoryID
where P.ProductID between 700 and 709
for xml raw
<row ProductID="706" Name="HL Road Frame - Red, 58" SubcategoryName="Road Frames" />
<row ProductID="707" Name="Sport-100 Helmet, Red" SubcategoryName="Helmets" />
<row ProductID="708" Name="Sport-100 Helmet, Black" SubcategoryName="Helmets" />
<row ProductID="709" Name="Mountain Bike Socks, M" SubcategoryName="Socks" />
select P.ProductID, P.Name, S.Name as SubcategoryName
from [Production].[Product] as P
left join [Production].[ProductSubcategory] as S
on P.ProductSubcategoryID = S.ProductSubcategoryID
where P.ProductID between 700 and 709
for xml raw('MyRow')

<MyRow ProductID="706" Name="HL Road Frame - Red, 58" SubcategoryName="Road Frames" />
<MyRow ProductID="707" Name="Sport-100 Helmet, Red" SubcategoryName="Helmets" />
<MyRow ProductID="708" Name="Sport-100 Helmet, Black" SubcategoryName="Helmets" />
<MyRow ProductID="709" Name="Mountain Bike Socks, M" SubcategoryName="Socks" />


select P.ProductID, P.Name, S.Name as SubcategoryName
from [Production].[Product] as P
left join [Production].[ProductSubcategory] as S
on P.ProductSubcategoryID = S.ProductSubcategoryID
where P.ProductID between 700 and 709
for xml raw('MyRow'), type

-- You can optionally specify the TYPE directive to retrieve the results as xml type. The TYPE directive does not change the content of the results. Only the data type of the results is affected. +
<MyRow ProductID="706" Name="HL Road Frame - Red, 58" SubcategoryName="Road Frames" />
<MyRow ProductID="707" Name="Sport-100 Helmet, Red" SubcategoryName="Helmets" />
<MyRow ProductID="708" Name="Sport-100 Helmet, Black" SubcategoryName="Helmets" />
<MyRow ProductID="709" Name="Mountain Bike Socks, M" SubcategoryName="Socks" />



select P.ProductID, P.Name, S.Name as SubcategoryName
from [Production].[Product] as P
left join [Production].[ProductSubcategory] as S
on P.ProductSubcategoryID = S.ProductSubcategoryID
where P.ProductID between 700 and 709
for xml raw, elements
<row>
  <ProductID>706</ProductID>
  <Name>HL Road Frame - Red, 58</Name>
  <SubcategoryName>Road Frames</SubcategoryName>
</row>
<row>
  <ProductID>707</ProductID>
  <Name>Sport-100 Helmet, Red</Name>
  <SubcategoryName>Helmets</SubcategoryName>
</row>
<row>
  <ProductID>708</ProductID>
  <Name>Sport-100 Helmet, Black</Name>
  <SubcategoryName>Helmets</SubcategoryName>
</row>
<row>
  <ProductID>709</ProductID>
  <Name>Mountain Bike Socks, M</Name>
  <SubcategoryName>Socks</SubcategoryName>
</row>
