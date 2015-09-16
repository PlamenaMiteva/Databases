SELECT d.Name AS Department, e.JobTitle, AVG(e.Salary) AS [Average Salary] 
FROM Employees e
JOIN Departments d
ON d.DepartmentID = e.DepartmentID
GROUP BY d.Name, e.JobTitle