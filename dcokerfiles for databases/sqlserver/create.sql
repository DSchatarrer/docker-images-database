USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'TestDB')
BEGIN
    CREATE DATABASE TestDB;
END;
GO

USE TestDB;
GO

CREATE TABLE TestTable (
    ID INT PRIMARY KEY,
    Name NVARCHAR(100)
);
GO
