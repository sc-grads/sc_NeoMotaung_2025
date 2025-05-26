select 1 as Tag, NULL as Parent
     , P.ProductID as [Product!1!ProductID]
     , P.Name as [Product!1!ProductName]
	 , S.Name as [Product!1!SubcategoryName]
from [Production].[Product] as P
left join [Production].[ProductSubcategory] as S
on P.ProductSubcategoryID = S.ProductSubcategoryID
where P.ProductID between 700 and 709
for xml explicit

<Product ProductID="706" ProductName="HL Road Frame - Red, 58" SubcategoryName="Road Frames" />
<Product ProductID="707" ProductName="Sport-100 Helmet, Red" SubcategoryName="Helmets" />
<Product ProductID="708" ProductName="Sport-100 Helmet, Black" SubcategoryName="Helmets" />
<Product ProductID="709" ProductName="Mountain Bike Socks, M" SubcategoryName="Socks" />
