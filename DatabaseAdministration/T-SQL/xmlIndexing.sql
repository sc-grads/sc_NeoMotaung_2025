CREATE XML INDEX secpk_tblXML_Path on #tblXML(xmlCol)
USING XML INDEX pk_tblXML FOR PATH;
CREATE XML INDEX secpk_tblXML_Value on #tblXML(xmlCol)
USING XML INDEX pk_tblXML FOR VALUE;
CREATE XML INDEX secpk_tblXML_Property on #tblXML(xmlCol)
USING XML INDEX pk_tblXML FOR PROPERTY;
