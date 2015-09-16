SELECT e.FirstName, e.LastName, e.JobTitle, m.FirstName, m.LastName FROM Employees e
JOIN Employees m
ON e.ManagerID = m.EmployeeID