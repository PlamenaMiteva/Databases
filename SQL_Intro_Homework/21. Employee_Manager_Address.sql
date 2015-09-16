SELECT e.FirstName + ' ' + e.LastName AS [Employee Name], 
a.AddressText AS [Employee Address], 
m.FirstName + ' ' + m.LastName AS [Manager Name], 
ad.AddressText AS [Manager Address] 
FROM Employees e
JOIN Addresses a
ON e.AddressID=a.AddressID
JOIN Employees m
ON e.ManagerID = m.EmployeeID
JOIN Addresses ad
ON m.AddressID=ad.AddressID
