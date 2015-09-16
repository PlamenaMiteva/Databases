USE Bank
GO

CREATE PROC dbo.usp_CalculateMonthlyIntrest 
(@AccountID int, @intrestRate decimal(5,2))
AS
DECLARE @sum decimal(18,2)
SELECT @sum = Balance FROM Accounts a
WHERE a.AccountID = @AccountID

SELECT FirstName, LastName, dbo.fn_CalcIntrest(@sum, @intrestRate, 1) AS [Sum incl. Intrest]
FROM Persons p
JOIN Accounts a
ON a.PersonID = p.PersonID
WHERE a.AccountID = @AccountID
GO

EXEC dbo.usp_CalculateMonthlyIntrest 
@AccountID = 2, 
@intrestRate=2.14

EXEC dbo.usp_CalculateMonthlyIntrest 
@AccountID = 8, 
@intrestRate= 1.4