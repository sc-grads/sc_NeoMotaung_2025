SELECT system_type_id, column_id, CONVERT(smallmoney, system_type_id) / CONVERT(smallmoney, column_id) as Calculation
FROM sys.all_columns

SELECT system_type_id, column_id, FLOOR(CONVERT(smallmoney, system_type_id) / CONVERT(smallmoney, column_id)) as Calculation
FROM sys.all_columns

SELECT system_type_id, column_id, CEILING(CONVERT(smallmoney, system_type_id) / CONVERT(smallmoney, column_id)) as Calculation
FROM sys.all_columns

SELECT system_type_id, column_id, ROUND(CONVERT(smallmoney, system_type_id) / CONVERT(smallmoney, column_id), 1) as Calculation
FROM sys.all_columns

SELECT CONVERT(tinyint, system_type_id) * 2, column_id, CONVERT(smallmoney, system_type_id) / CONVERT(smallmoney, column_id) as Calculation
FROM sys.all_columns

