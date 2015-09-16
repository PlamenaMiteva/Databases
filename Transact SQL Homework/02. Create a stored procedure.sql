CREATE PROC usp_SelectClientsByBalance(@minBalance decimal = 0)
AS
  SELECT p.FirstName, p.LastName, a.Balance   
  FROM Persons p
  JOIN Accounts a
  ON a.PersonID = p.PersonID
  WHERE a.Balance >= @minBalance
  ORDER BY Balance DESC
GO

EXEC usp_SelectClientsByBalance -100
