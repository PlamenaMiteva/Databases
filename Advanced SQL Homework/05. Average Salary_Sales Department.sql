SELECT AVG(Salary) AS [Average Salary for Sales Department] FROM Employees e
JOIN Departments d
ON d.DepartmentID = e.DepartmentID
WHERE d.Name = 'Sales'