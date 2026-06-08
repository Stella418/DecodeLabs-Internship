/*
==============================================================================
Create Database
==============================================================================
Script Purpose:
    This script drops and recreates the 'DecodeLabs' database.

WARNING:
    Running this script will permanently delete the database if it exists.
==============================================================================
*/

USE master;
GO

-- Drop the 'DecodeLabs' database if exists
IF DB_ID('DecodeLabs') IS NOT NULL
BEGIN
    ALTER DATABASE DecodeLabs SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DecodeLabs;
END
GO

-- Recreate database

CREATE DATABASE DecodeLabs
