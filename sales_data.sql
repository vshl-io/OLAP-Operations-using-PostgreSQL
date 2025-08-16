-- 1. Create Table
CREATE TABLE sales_sample (
    Product_Id INTEGER,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount NUMERIC
);

-- 2. Insert Sample Data
INSERT INTO sales_sample (Product_Id, Region, Date, Sales_Amount) VALUES
(101, 'East', '2025-08-01', 500),
(102, 'West', '2025-08-01', 450),
(103, 'North', '2025-08-02', 700),
(101, 'East', '2025-08-03', 600),
(102, 'West', '2025-08-03', 650),
(103, 'North', '2025-08-03', 300),
(101, 'South', '2025-08-04', 550),
(102, 'South', '2025-08-04', 500),
(103, 'East', '2025-08-05', 750),
(101, 'West', '2025-08-06', 400);

-- 3. Drill Down: Region to Product level
SELECT Region, Product_Id, SUM(Sales_Amount) AS total_sales_amount
FROM sales_sample
GROUP BY Region, Product_Id
ORDER BY Region, Product_Id;

-- 4. Rollup: Product to Region level
SELECT Region, Product_Id, SUM(Sales_Amount) AS total_sales_amount
FROM sales_sample
GROUP BY ROLLUP (Region, Product_Id)
ORDER BY Region, Product_Id;

-- 5. Cube: Analyze by Product, Region, and Date
SELECT Product_Id, Region, Date, SUM(Sales_Amount) AS total_sales_amount
FROM sales_sample
GROUP BY CUBE (Product_Id, Region, Date)
ORDER BY Product_Id, Region, Date;

-- 6. Slice: Filter by Region or Date
SELECT * FROM sales_sample
WHERE Region = 'East';

-- 7. Dice: Filter by multiple dimensions
SELECT * FROM sales_sample
WHERE Region IN ('East', 'West')
  AND Product_Id IN (101, 102)
  AND Date BETWEEN '2025-08-01' AND '2025-08-04';
