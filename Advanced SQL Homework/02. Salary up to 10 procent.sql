SELECT FirstName, LastName, Salary 
FROM Employees
WHERE Salary <= (
SELECT MIN(Salary)*1.1 FROM Employees)
ORDER BY Salary DESC