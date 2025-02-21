--RIGHT OUTER JOIN on staff and stores table with store id

SELECT TOP (1000) *
  FROM [BikeStores].[sales].[staffs] s
  RIGHT OUTER JOIN [BikeStores].[sales].[staffs] st
  ON s.store_id = st.store_id;
