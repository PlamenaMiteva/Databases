CREATE TABLE WorkHours (
  WorkhourID int IDENTITY,
  WorkDate datetime NOT NULL,
  Task nvarchar(100) NOT NULL,
  WorkHours time NOT NULL,
  Comments nvarchar(200),
  EmployeeID int,
  CONSTRAINT PK_WorkHours PRIMARY KEY(WorkhourID),
 CONSTRAINT FK_WorkHours_Employees
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
 )
