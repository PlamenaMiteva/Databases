USE Bank
GO

CREATE PROC dbo.usp_DepositMoney 
(@AccountID int, @money decimal(18,2))
AS
DECLARE @sum decimal(18,2)
SELECT @sum = Balance FROM Accounts a
WHERE a.AccountID = @AccountID

SET @sum = @sum + @money

UPDATE Accounts
SET Balance = @sum
WHERE AccountID = @AccountID

SELECT FirstName, LastName, a.Balance
FROM Persons p
JOIN Accounts a
ON a.PersonID = p.PersonID
WHERE a.AccountID = @AccountID
GO

USE Bank
GO

CREATE PROC dbo.usp_WithdrawMoney 
(@AccountID int, @money decimal(18,2))
AS
DECLARE @sum decimal(18,2)
SELECT @sum = Balance FROM Accounts a
WHERE a.AccountID = @AccountID
IF(@sum < @money)
BEGIN
PRINT 'Sorry, transaction cannot be completed because the sum you would like to withdraw exceeds your account''s balance'
END
ELSE
BEGIN
SET @sum = @sum - @money

UPDATE Accounts
SET Balance = @sum
WHERE AccountID = @AccountID

SELECT FirstName, LastName, a.Balance
FROM Persons p
JOIN Accounts a
ON a.PersonID = p.PersonID
WHERE a.AccountID = @AccountID
END
GO



EXEC dbo.usp_DepositMoney  
@AccountID = 1, 
@money = 200.14

EXEC dbo.usp_WithdrawMoney 
@AccountID = 2, 
@money = 2000.37

EXEC dbo.usp_WithdrawMoney 
@AccountID = 11, 
@money = 200