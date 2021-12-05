USE AdventureWorks2008R2;

 

--Joins
SELECT a.CustomerID
FROM Sales.SalesOrderHeader soh
    RIGHT JOIN Sales.Customer a ON soh.CustomerID = a.CustomerID
WHERE SalesOrderID IS NULL;

 


--SubQuery
SELECT a.CustomerID
FROM Sales.Customer a
WHERE a.CustomerID NOT IN (SELECT CustomerID FROM Sales.SalesOrderHeader);

 


--CTE
WITH CustomersWithoutPlacedOrder (CustmerID) 
AS 
(
    SELECT a.CustomerID
    FROM Sales.SalesOrderHeader soh
    RIGHT JOIN Sales.Customer a ON soh.CustomerID = a.CustomerID
    WHERE SalesOrderID IS NULL
)
SELECT * FROM CustomersWithoutPlacedOrder;
    


--Exists
SELECT a.CustomerID
FROM Sales.Customer a
WHERE NOT EXISTS (SELECT s.CustomerID 
                FROM Sales.SalesOrderHeader AS s
                WHERE s.CustomerID = a.CustomerID);