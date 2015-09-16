SELECT COUNT(e.EmployeeID) AS [Employees with Manager]
FROM Employees e
WHERE EXISTS
  (SELECT EmployeeID FROM Employees m
   WHERE m.EmployeeID = e.ManagerID)
