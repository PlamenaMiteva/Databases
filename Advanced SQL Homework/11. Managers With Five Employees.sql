SELECT m.FirstName, m.LastName, COUNT(e.EmployeeID) AS [Employees Count]
FROM Employees e
JOIN Employees m
ON m.EmployeeID = e.ManagerID
GROUP BY m.FirstName, m.LastName
HAVING COUNT(e.EmployeeID) = 5