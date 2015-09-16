CREATE TRIGGER tr_AccountsUpdate ON Accounts FOR UPDATE
AS
DECLARE @account int, @oldSum decimal (18, 2), @newSum decimal (18, 2)

   IF UPDATE (Balance) 
    BEGIN
	SET NOCOUNT ON
	
	SELECT @account = AccountID, @oldSum = Balance
	FROM deleted

	SELECT  @newSum = Balance
	FROM Accounts
	WHERE AccountID = @account

      INSERT INTO Logs (AccountID, OldSum, NewSum)
	  VALUES (@account, @oldSum, @newSum)
    END
GO

UPDATE Accounts
SET Balance = 2000
WHERE AccountID = 2