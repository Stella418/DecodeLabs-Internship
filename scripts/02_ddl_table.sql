/*
===================================================================================
DDL Script: Create Table
===================================================================================
Script Purpose:
    This script drops and recreates table in the database.
    Run this script to reset and rebuild the table structure.
===================================================================================
*/



IF OBJECT_ID ('orders', 'U') IS NOT NULL
	DROP TABLE orders;
GO

CREATE TABLE orders (
OrderID               NVARCHAR (50) PRIMARY KEY,
Date                  DATE,
CustomerID            NVARCHAR (50),
Product               NVARCHAR (50),
Quantity              INT,
UnitPrice             DECIMAL,
ShippingAddress       NVARCHAR (50),
PaymentMethod         NVARCHAR (50),
OrderStatus           NVARCHAR (50),
TrackingNumber        NVARCHAR (50),
ItemsInCart           INT,
CouponCode            NVARCHAR (50),
ReferralSource        NVARCHAR (50),
TotalPrice            Decimal
);
