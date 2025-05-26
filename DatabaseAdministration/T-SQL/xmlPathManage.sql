select P.ProductID, P.Name, S.Name as SubcategoryName
from [Production].[Product] as P
left join [Production].[ProductSubcategory] as S
on P.ProductSubcategoryID = S.ProductSubcategoryID
where P.ProductID between 700 and 709
for xml path
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
select P.ProductID, P.Name, S.Name as SubcategoryName
from [Production].[Product] as P
left join [Production].[ProductSubcategory] as S
on P.ProductSubcategoryID = S.ProductSubcategoryID
where P.ProductID between 700 and 709
for xml path('Products')
<Products>
  <ProductID>706</ProductID>
  <Name>HL Road Frame - Red, 58</Name>
  <SubcategoryName>Road Frames</SubcategoryName>
</Products>
<Products>
  <ProductID>707</ProductID>
  <Name>Sport-100 Helmet, Red</Name>
  <SubcategoryName>Helmets</SubcategoryName>
</Products>
<Products>
  <ProductID>708</ProductID>
  <Name>Sport-100 Helmet, Black</Name>
  <SubcategoryName>Helmets</SubcategoryName>
</Products>
<Products>
  <ProductID>709</ProductID>
  <Name>Mountain Bike Socks, M</Name>
  <SubcategoryName>Socks</SubcategoryName>
</Products>
select P.ProductID as '@ProductID', P.Name, S.Name as SubcategoryName
from [Production].[Product] as P
left join [Production].[ProductSubcategory] as S
on P.ProductSubcategoryID = S.ProductSubcategoryID
where P.ProductID between 700 and 709
for xml path('Products')
<Products ProductID="706">
  <Name>HL Road Frame - Red, 58</Name>
  <SubcategoryName>Road Frames</SubcategoryName>
</Products>
<Products ProductID="707">
  <Name>Sport-100 Helmet, Red</Name>
  <SubcategoryName>Helmets</SubcategoryName>
</Products>
<Products ProductID="708">
  <Name>Sport-100 Helmet, Black</Name>
  <SubcategoryName>Helmets</SubcategoryName>
</Products>
<Products ProductID="709">
  <Name>Mountain Bike Socks, M</Name>
  <SubcategoryName>Socks</SubcategoryName>
</Products>
select P.ProductID as '@ProductID', P.Name as '@ProductName', S.Name as SubcategoryName
from [Production].[Product] as P
left join [Production].[ProductSubcategory] as S
on P.ProductSubcategoryID = S.ProductSubcategoryID
where P.ProductID between 700 and 709
for xml path('Products')
--@ = attribute, otherwise it is an element.
<Products ProductID="706" ProductName="HL Road Frame - Red, 58">
  <SubcategoryName>Road Frames</SubcategoryName>
</Products>
<Products ProductID="707" ProductName="Sport-100 Helmet, Red">
  <SubcategoryName>Helmets</SubcategoryName>
</Products>
<Products ProductID="708" ProductName="Sport-100 Helmet, Black">
  <SubcategoryName>Helmets</SubcategoryName>
</Products>
<Products ProductID="709" ProductName="Mountain Bike Socks, M">
  <SubcategoryName>Socks</SubcategoryName>
</Products>
select P.ProductID as '@ProductID', P.Name as '@ProductName'
, S.Name as 'Subcategory/SubcategoryName'
from [Production].[Product] as P
left join [Production].[ProductSubcategory] as S
on P.ProductSubcategoryID = S.ProductSubcategoryID
where P.ProductID between 700 and 709
for xml path('Products')

<Products ProductID="706" ProductName="HL Road Frame - Red, 58">
  <Subcategory>
    <SubcategoryName>Road Frames</SubcategoryName>
  </Subcategory>
</Products>
<Products ProductID="707" ProductName="Sport-100 Helmet, Red">
  <Subcategory>
    <SubcategoryName>Helmets</SubcategoryName>
  </Subcategory>
</Products>
<Products ProductID="708" ProductName="Sport-100 Helmet, Black">
  <Subcategory>
    <SubcategoryName>Helmets</SubcategoryName>
  </Subcategory>
</Products>
<Products ProductID="709" ProductName="Mountain Bike Socks, M">
  <Subcategory>
    <SubcategoryName>Socks</SubcategoryName>
  </Subcategory>
</Products>
