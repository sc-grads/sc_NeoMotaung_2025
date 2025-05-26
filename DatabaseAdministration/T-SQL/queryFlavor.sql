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
SELECT @x.query('  
   for $Item in /Shopping/ShoppingTrip/Item  
   return $Item
')  

<Item Cost="5">Bananas</Item><Item Cost="4">Apples</Item><Item Cost="3">Cherries</Item><Item>Emeralds</Item><Item>Diamonds</Item><Item>Furniture</Item>

SELECT @x.query('  
   for $Item in /Shopping/ShoppingTrip/Item  
   return string($Item)  
')  

Bananas Apples Cherries Emeralds Diamonds Furniture

SELECT @x.query('  
   for $Item in /Shopping/ShoppingTrip/Item  
   return concat(string($Item),";")  
')  
Bananas; Apples; Cherries; Emeralds; Diamonds; Furniture;
SELECT @x.query('  
   for $Item in /Shopping/ShoppingTrip[1]/Item  
   order by $Item/@Cost
   return concat(string($Item),";")
')  
Bananas; Cherries; Apples;
SELECT @x.query('  
   for $Item in /Shopping/ShoppingTrip[1]/Item  
   let $Cost := $Item/@Cost
   where $Cost = 4
   order by $Cost
   return concat(string($Item),";")
')
Apples;
