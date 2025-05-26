SET @x.modify('  
   replace value of (/Shopping/ShoppingTrip[1]/Item[3]/@Cost)[1]
   with "5.0"
')
SELECT @x
<Shopping ShopperName="Phillip Burton">
  <ShoppingTrip ShoppingTripID="L1">
    <Item Cost="5.0">Apples</Item>
    <Item Cost="2">Bananas</Item>
    <Item Cost="3">Cherries</Item>
  </ShoppingTrip>
  <ShoppingTrip ShoppingTripID="L2">
    <Item>Diamonds</Item>
    <Item>Emeralds</Item>
    <Item>Furniture</Item>
  </ShoppingTrip>
</Shopping>
SET @x.modify('  
   insert <Item Cost="5">Manu Item 5 at Loc 1</Item>
   into (/Shopping/ShoppingTrip)[1]
')
SELECT @x
<Shopping ShopperName="Phillip Burton">
  <ShoppingTrip ShoppingTripID="L1">
    <Item Cost="4">Apples</Item>
    <Item Cost="2">Bananas</Item>
    <Item Cost="3">Cherries</Item>
    <Item Cost="5">Manu Item 5 at Loc 1</Item>
  </ShoppingTrip>
  <ShoppingTrip ShoppingTripID="L2">
    <Item>Diamonds</Item>
    <Item>Emeralds</Item>
    <Item>Furniture</Item>
  </ShoppingTrip>
</Shopping>
SET @x.modify('  
   delete (/Shopping/ShoppingTrip)[1]
')
SELECT @x
<Shopping ShopperName="Phillip Burton">
  <ShoppingTrip ShoppingTripID="L2">
    <Item>Diamonds</Item>
    <Item>Emeralds</Item>
    <Item>Furniture</Item>
  </ShoppingTrip>
</Shopping>
