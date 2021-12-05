USE AdventureWorks2008R2;



Select *  From Sales.SalesPerson
 
 Select Person.FirstName, Person.LastName
 From Person.Person
Where FirstName like 'B%'
Order by FirstName asc;



 

Select Person.FirstName, Person.LastName, HumanResources.Employee.JobTitle
From Person.Person INNER JOIN HumanResources.Employee
ON Person.BusinessEntityID= HumanResources.Employee.BusinessEntityID


 



Select Name, Color, Weight
From Production. Product
Where weight is not null and color is not null

 

Select Description,  ISNULL(MaxQty,0.00) 
From Sales.SpecialOffer


 

Select CurrencyRateDate, AverageRate, FromCurrencyCode, ToCurrencyCode
From Sales.CurrencyRate
Where datepart(year,CurrencyRateDate)=2005 and ToCurrencyCode='GBP';


 



SELECT ROW_NUMBER() OVER(ORDER BY FirstName, LastName) AS 'Sr. No.', FirstName, LastName
FROM Person.Person
WHERE FirstName LIKE '%ss%';

 

 


SELECT BusinessEntityID AS 'SalesPersonID',
    CASE
        WHEN CommissionPct = 0.0 then 'BAND 0'
        WHEN CommissionPct > 0.0 AND CommissionPct <=0.01 then 'BAND 1'
        WHEN CommissionPct > 0.01 AND CommissionPct <=0.015 then 'BAND 2'
        WHEN CommissionPct > 0.015 then 'BAND 3'
        END AS 'Commission Band'
FROM Sales.SalesPerson;

 


DECLARE @ID int;
SELECT @ID = BusinessEntityID 
FROM Person.Person 
WHERE FirstName = 'Ruth' 
    AND LastName = 'Ellerbrock'
    AND PersonType = 'EM';
EXEC dbo.uspGetEmployeeManagers @BusinessEntityID = @ID;

 


SELECT MAX(dbo.ufnGetStock(ProductID)) FROM Production.Product;