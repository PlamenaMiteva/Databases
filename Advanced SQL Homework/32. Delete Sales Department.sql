BEGIN TRAN
alter table Departments nocheck constraint all
DELETE FROM Employees
WHERE DepartmentID = 3
alter table Departments check constraint all
ROLLBACK TRAN

