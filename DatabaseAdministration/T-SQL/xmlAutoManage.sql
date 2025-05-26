select P.ProductID, P.Name, S.Name as SubcategoryName
from [Production].[Product] as P
left join [Production].[ProductSubcategory] as S
on P.ProductSubcategoryID = S.ProductSubcategoryID
where P.ProductID between 700 and 709
for xml auto

<P ProductID="706" Name="HL Road Frame - Red, 58">
  <S SubcategoryName="Road Frames" />
</P>
<P ProductID="707" Name="Sport-100 Helmet, Red">
  <S SubcategoryName="Helmets" />
</P>
<P ProductID="708" Name="Sport-100 Helmet, Black">
  <S SubcategoryName="Helmets" />
</P>
<P ProductID="709" Name="Mountain Bike Socks, M">
  <S SubcategoryName="Socks" />
</P>
select P.ProductID, P.Name, S.Name as SubcategoryName
from [Production].[Product] as P
left join [Production].[ProductSubcategory] as S
on P.ProductSubcategoryID = S.ProductSubcategoryID
where P.ProductID between 700 and 709
for xml auto, elements
<P>
  <ProductID>706</ProductID>
  <Name>HL Road Frame - Red, 58</Name>
  <S>
    <SubcategoryName>Road Frames</SubcategoryName>
  </S>
</P>
<P>
  <ProductID>707</ProductID>
  <Name>Sport-100 Helmet, Red</Name>
  <S>
    <SubcategoryName>Helmets</SubcategoryName>
  </S>
</P>
<P>
  <ProductID>708</ProductID>
  <Name>Sport-100 Helmet, Black</Name>
  <S>
    <SubcategoryName>Helmets</SubcategoryName>
  </S>
</P>
<P>
  <ProductID>709</ProductID>
  <Name>Mountain Bike Socks, M</Name>
  <S>
    <SubcategoryName>Socks</SubcategoryName>
  </S>
</P>
