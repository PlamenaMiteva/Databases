CREATE TABLE Users (
  UserID int IDENTITY,
  UserName nvarchar(50) NOT NULL,
  Password nvarchar(50),
  FullName nvarchar(100) NOT NULL,
  LastLoginTime datetime,
  CONSTRAINT PK_Users PRIMARY KEY(UserID),
  CHECK (LEN(Password) >= 5)
 )
 
INSERT INTO Users (Username, Password, FullName)
SELECT LOWER(LEFT(FirstName, 1) + LastName), 
 LOWER(LEFT(FirstName, 1) + LastName),
 FirstName + ' ' + LastName
 FROM Employees
 WHERE LEN(LOWER(LEFT(FirstName, 1) + LastName))>=5

