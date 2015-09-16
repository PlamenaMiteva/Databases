SELECT t.Name, COUNT(DISTINCT m.EmployeeID) AS [Number of managers]
FROM Employees e
JOIN Addresses a
ON a.AddressID = e.AddressID
JOIN Towns t
ON t.TownID = a.TownID
JOIN Employees m
ON e.ManagerID = m.EmployeeID
GROUP BY t.Name