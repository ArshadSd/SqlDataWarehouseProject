-- Create Database called DataWarehouse

USE master;
GO

IF EXISTS( SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USEH WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO
--CREATE DATABASE
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

CREATE SCHEMA bronze;
go
CREATE SCHEMA silver;
go
CREATE SCHEMA gold;
go
