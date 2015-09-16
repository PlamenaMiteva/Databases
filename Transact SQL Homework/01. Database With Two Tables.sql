USE Bank
GO

CREATE PROC dbo.usp_SelectClientFullName 
AS
  SELECT CONCAT(FirstName, ' ', LastName) AS [Full Name]
  FROM Persons
  
GO

exec usp_SelectClientFullName
