SELECT TOP 1 t.Name, COUNT(e.EmployeeID) AS [Number of employees]
FROM Employees e
JOIN Addresses a
ON a.AddressID = e.AddressID
JOIN Towns t
ON t.TownID = a.TownID
GROUP BY t.Name
ORDER BY 'Number of employees' DESC



