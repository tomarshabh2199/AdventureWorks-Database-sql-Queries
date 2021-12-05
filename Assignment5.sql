USE AdventureWorks2008R2;


GO
CREATE PROCEDURE Person.nametype
    @Type nchar(2) = 'SH'
AS
SELECT FirstName FROM Person.Person WHERE PersonType = @Type
GO
EXEC Person.nametype @Type ='PR'