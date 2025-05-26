select P.ProductID, P.Name, S.Name as SubcategoryName
from [Production].[Product] as P
left join [Production].[ProductSubcategory] as S
on P.ProductSubcategoryID = S.ProductSubcategoryID
where P.ProductID between 700 and 709
for xml raw,xmldata  --this is being depreciated

<Schema name="Schema2" xmlns="urn:schemas-microsoft-com:xml-data" xmlns:dt="urn:schemas-microsoft-com:datatypes">
  <ElementType name="row" content="empty" model="closed">
    <AttributeType name="ProductID" dt:type="i4" />
    <AttributeType name="Name" dt:type="string" />
    <AttributeType name="SubcategoryName" dt:type="string" />
    <attribute type="ProductID" />
    <attribute type="Name" />
    <attribute type="SubcategoryName" />
  </ElementType>
</Schema>
<row xmlns="x-schema:#Schema2" ProductID="706" Name="HL Road Frame - Red, 58" SubcategoryName="Road Frames" />
<row xmlns="x-schema:#Schema2" ProductID="707" Name="Sport-100 Helmet, Red" SubcategoryName="Helmets" />
<row xmlns="x-schema:#Schema2" ProductID="708" Name="Sport-100 Helmet, Black" SubcategoryName="Helmets" />
<row xmlns="x-schema:#Schema2" ProductID="709" Name="Mountain Bike Socks, M" SubcategoryName="Socks" />
select P.ProductID, P.Name, S.Name as SubcategoryName
from [Production].[Product] as P
left join [Production].[ProductSubcategory] as S
on P.ProductSubcategoryID = S.ProductSubcategoryID
where P.ProductID between 700 and 709
for xml raw,xmlschema
<xsd:schema targetNamespace="urn:schemas-microsoft-com:sql:SqlRowSet2" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:sqltypes="http://schemas.microsoft.com/sqlserver/2004/sqltypes" elementFormDefault="qualified">
  <xsd:import namespace="http://schemas.microsoft.com/sqlserver/2004/sqltypes" schemaLocation="http://schemas.microsoft.com/sqlserver/2004/sqltypes/sqltypes.xsd" />
  <xsd:element name="row">
    <xsd:complexType>
      <xsd:attribute name="ProductID" type="sqltypes:int" use="required" />
      <xsd:attribute name="Name" use="required">
        <xsd:simpleType sqltypes:sqlTypeAlias="[AdventureWorks2014].[dbo].[Name]">
          <xsd:restriction base="sqltypes:nvarchar" sqltypes:localeId="1033" sqltypes:sqlCompareOptions="IgnoreCase IgnoreKanaType IgnoreWidth" sqltypes:sqlSortId="52">
            <xsd:maxLength value="50" />
          </xsd:restriction>
        </xsd:simpleType>
      </xsd:attribute>
      <xsd:attribute name="SubcategoryName">
        <xsd:simpleType sqltypes:sqlTypeAlias="[AdventureWorks2014].[dbo].[Name]">
          <xsd:restriction base="sqltypes:nvarchar" sqltypes:localeId="1033" sqltypes:sqlCompareOptions="IgnoreCase IgnoreKanaType IgnoreWidth" sqltypes:sqlSortId="52">
            <xsd:maxLength value="50" />
          </xsd:restriction>
        </xsd:simpleType>
      </xsd:attribute>
    </xsd:complexType>
  </xsd:element>
</xsd:schema>
<row xmlns="urn:schemas-microsoft-com:sql:SqlRowSet2" ProductID="706" Name="HL Road Frame - Red, 58" SubcategoryName="Road Frames" />
<row xmlns="urn:schemas-microsoft-com:sql:SqlRowSet2" ProductID="707" Name="Sport-100 Helmet, Red" SubcategoryName="Helmets" />
<row xmlns="urn:schemas-microsoft-com:sql:SqlRowSet2" ProductID="708" Name="Sport-100 Helmet, Black" SubcategoryName="Helmets" />
<row xmlns="urn:schemas-microsoft-com:sql:SqlRowSet2" ProductID="709" Name="Mountain Bike Socks, M" SubcategoryName="Socks" />
