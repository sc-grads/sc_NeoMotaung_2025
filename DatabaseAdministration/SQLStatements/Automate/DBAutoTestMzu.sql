IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'neoAutoTest')
BEGIN
    CREATE DATABASE neoAutoTest;
    PRINT 'Database neoAutoTest created successfully.';
END
ELSE
BEGIN
    PRINT 'Database neoAutoTest already exists.';
END