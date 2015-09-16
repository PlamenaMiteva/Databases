CREATE TABLE Users (
  UserID int IDENTITY,
  UserName nvarchar(50) NOT NULL UNIQUE,
  Password nvarchar(50),
  FullName nvarchar(100) NOT NULL,
  LastLoginTime datetime,
  CONSTRAINT PK_Users PRIMARY KEY(UserID),
  CHECK (LEN(Password) >= 5)
 )
