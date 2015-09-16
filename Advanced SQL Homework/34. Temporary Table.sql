CREATE TABLE #TempTable (
EmployeeID int,
ProjectID int 
CONSTRAINT FK_TempTable_Employees
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
CONSTRAINT FK_TempTable_Projects
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID));

INSERT INTO #TempTable (EmployeeID, ProjectID) 
SELECT EmployeeID, ProjectID 
FROM EmployeesProjects

DROP TABLE EmployeesProjects 

SELECT * FROM #TempTable