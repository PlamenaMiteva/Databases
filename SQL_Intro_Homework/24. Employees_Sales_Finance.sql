SELECT e.FirstName + ' ' + e.LastName AS [Employee Name],
d.Name AS Department,
e.HireDate
FROM Employees e
JOIN Departments d
ON d.DepartmentID = e.DepartmentID
WHERE (d.Name = 'Sales' OR d.Name = 'Finance')
AND (e.HireDate BETWEEN '1995-01-01' AND '2005-12-31')