USE AdventureWorks2008R2;


GO
CREATE TRIGGER Update_TriggerProduct
ON Production.Product
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(ListPrice)
        BEGIN
            UPDATE Production.Product
            SET ListPrice = IIF((lp.ListPrice - d.ListPrice) > d.ListPrice*0.15, d.ListPrice, lp.ListPrice)
            FROM deleted AS d, Production.Product AS p
            INNER JOIN inserted AS lp ON ls.ProductID = p.ProductID
        END
END
GO