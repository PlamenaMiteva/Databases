SELECT COUNT(EmployeeID) AS [Sales Employees Count] FROM Employees e
JOIN Departments d
ON d.DepartmentID = e.DepartmentID
WHERE d.Name = 'Sales'