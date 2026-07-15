USE master;
GO

IF DB_ID(N'SupplyChainAnalytics') IS NULL
BEGIN
    CREATE DATABASE SupplyChainAnalytics;
END;
GO

USE SupplyChainAnalytics;
GO