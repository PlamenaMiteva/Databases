SELECT t.Name AS Town, d.Name AS Department, COUNT(e.EmployeeID) AS [Employees Count] FROM Addresses a
JOIN Towns t
ON a.TownID = t.TownID
JOIN Employees e
ON e.AddressID = a.AddressID
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY t.Name, d.Name
