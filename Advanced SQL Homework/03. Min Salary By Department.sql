SELECT FirstName + ' ' + LastName AS FullName, Salary, d.Name AS Department
FROM Employees e
JOIN Departments d
   ON d.DepartmentID = e.DepartmentID
WHERE Salary = 
  (SELECT MIN(Salary) FROM Employees 
   WHERE DepartmentID = e.DepartmentID)   

