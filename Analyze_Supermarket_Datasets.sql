-- check abuja branch dataset
SELECT *
FROM AnalyzeSupermarketDataset..Abuja_Branch;
-- abuja branch have 332 count

-- check lagos branch dataset
SELECT *
FROM AnalyzeSupermarketDataset..Lagos_Branch;
-- lagos branch have 332 count

-- check abuja port harcourt dataset
SELECT *
FROM AnalyzeSupermarketDataset..Port_Harcourt_Branch;
-- port harcourt branch have 328 count

-- merge all three dataset together
SELECT *
FROM AnalyzeSupermarketDataset..Abuja_Branch
UNION
SELECT *
FROM AnalyzeSupermarketDataset..Lagos_Branch
UNION
SELECT *
FROM AnalyzeSupermarketDataset..Port_Harcourt_Branch;
-- total count resukts to 1000

-- create temp table to store merge dataset
DROP TABLE IF EXISTS all_branch
CREATE TABLE all_branch(
[Invoice ID] NVARCHAR(255),
Branch NVARCHAR(1),
City NVARCHAR(255),
[Customer type] NVARCHAR(255),
Gender NVARCHAR(255),
[Product line] NVARCHAR(255),
[Unit price] NUMERIC,
Quantity NUMERIC,
[Tax 5%] NUMERIC,
Total NUMERIC,
Date DATETIME,
Time DATETIME,
Payment NVARCHAR(255),
cogs NUMERIC,
[gross margin percentage] NUMERIC,
[gross income] NUMERIC,
Rating NUMERIC
)
INSERT INTO all_branch
SELECT *
FROM AnalyzeSupermarketDataset..Abuja_Branch
UNION
SELECT *
FROM AnalyzeSupermarketDataset..Lagos_Branch
UNION
SELECT *
FROM AnalyzeSupermarketDataset..Port_Harcourt_Branch;

--view temp table
SELECT *
FROM AnalyzeSupermarketDataset..all_branch;

-- UNIQUE VALUES IN COLUMN
-- check unique branch
SELECT DISTINCT Branch
FROM AnalyzeSupermarketDataset..all_branch;
-- 3 unique branch viz A, B and C

-- check unique city
SELECT DISTINCT City
FROM AnalyzeSupermarketDataset..all_branch;
-- 3 unique city Lagos, Port Harcourt and Abuja

-- check unique gender
SELECT DISTINCT Gender
FROM AnalyzeSupermarketDataset..all_branch;
-- 2 unique Gender Male and Female

-- check unique product line
SELECT DISTINCT [Product line]
FROM AnalyzeSupermarketDataset..all_branch;
-- 6 unique Fashion accessories
-- Health and beauty
-- Electronic accessories
-- Food and beverages
-- Sport and travel
-- Home and lifestyle

-- check unique payment
SELECT DISTINCT Payment
FROM AnalyzeSupermarketDataset..all_branch;
-- 3 unique Payment Epay, Cash and Card

-- VALUE COUNT FOR CATIGORICAL COLUMN
-- value count for city
SELECT City, COUNT(*) as Count
FROM AnalyzeSupermarketDataset..all_branch
GROUP BY City;

-- value count for Branch
SELECT Branch, COUNT(*) as Count
FROM AnalyzeSupermarketDataset..all_branch
GROUP BY Branch;

-- value count for Customer type
SELECT [Customer type], COUNT(*) as Count
FROM AnalyzeSupermarketDataset..all_branch
GROUP BY [Customer type];

-- value count for Product line
SELECT [Product line], COUNT(*) as Count
FROM AnalyzeSupermarketDataset..all_branch
GROUP BY [Product line];

-- value count for Gender
SELECT Gender, COUNT(*) as Count
FROM AnalyzeSupermarketDataset..all_branch
GROUP BY Gender;

-- value count for Payment
SELECT Payment, COUNT(*) as Count
FROM AnalyzeSupermarketDataset..all_branch
GROUP BY Payment;

-- AGGREGATION BY GROUP
-- sum by City group
SELECT City, SUM([Unit price]) AS [Total Unit price], SUM(Quantity) AS [Total Quantity], SUM(Total) AS [Sum Total], SUM([gross income]) AS [Total gross income]
FROM AnalyzeSupermarketDataset..all_branch
GROUP BY City;

-- average by City group
SELECT City, AVG([Unit price]) AS [Avg Unit price], AVG(Quantity) AS [Avg Quantity], AVG(Total) AS [Avg Total], AVG([gross income]) AS [Avg gross income]
FROM AnalyzeSupermarketDataset..all_branch
GROUP BY City;

-- gross income of Abuja
SELECT City, [gross income]
FROM AnalyzeSupermarketDataset..all_branch
WHERE City = 'Abuja';

-- gross income of Lagos
SELECT City, [gross income]
FROM AnalyzeSupermarketDataset..all_branch
WHERE City = 'Lagos';

-- gross income of Port Harcourt
SELECT City, [gross income]
FROM AnalyzeSupermarketDataset..all_branch
WHERE City = 'Port Harcourt';

-- total gross income by city
SELECT City, SUM([gross income]) AS [Total gross income]
FROM AnalyzeSupermarketDataset..all_branch
GROUP BY City;
-- The city with the highest total gross income is Port Harcourt, having a total gross income of #1895463.54,
-- with a difference of #74932.02 to the city with the lowest gross income, Abuja.

-- Unit price of Abuja
SELECT City, [Unit price]
FROM AnalyzeSupermarketDataset..all_branch
WHERE City = 'Abuja';

-- Unit price of Lagos
SELECT City, [Unit price]
FROM AnalyzeSupermarketDataset..all_branch
WHERE City = 'Lagos';

-- Unit price of Port Harcourt
SELECT City, [Unit price]
FROM AnalyzeSupermarketDataset..all_branch
WHERE City = 'Port Harcourt';

-- total Unit price by city
SELECT City, SUM([Unit price]) AS [Total Unit price]
FROM AnalyzeSupermarketDataset..all_branch
GROUP BY City;
-- The city with the highest total Unit price is Lagos, having a total Unit price of #6705176.4,
-- with a difference of #52779.6 to the city with the lowest Unit price, Abuja.

-- Quantity of Abuja
SELECT City, Quantity
FROM AnalyzeSupermarketDataset..all_branch
WHERE City = 'Abuja';

-- Quantity of Lagos
SELECT City, Quantity
FROM AnalyzeSupermarketDataset..all_branch
WHERE City = 'Lagos';

-- Quantity of Port Harcourt
SELECT City, Quantity
FROM AnalyzeSupermarketDataset..all_branch
WHERE City = 'Port Harcourt';

-- total Quantity by city
SELECT City, SUM(Quantity) AS [Total Quantity]
FROM AnalyzeSupermarketDataset..all_branch
GROUP BY City;
-- The city with the highest total Quantity is Lagos, having a total Quantity of 1859,
-- with a difference of 39 to the city with the lowest Quantity, Abuja.

