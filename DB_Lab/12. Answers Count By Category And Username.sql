SELECT c.Name AS Category, u.Username, u.PhoneNumber, COUNT(a.Id) AS [Answers Count] FROM Categories c
LEFT JOIN Questions q
ON q.CategoryId = c.Id
LEFT JOIN Answers a
ON a.QuestionId = q.Id
JOIN Users u
ON u.Id = a.UserId
GROUP BY c.Name, u.Username, u.PhoneNumber
HAVING u.PhoneNumber IS NOT NULL
ORDER BY COUNT(a.Id) DESC, u.Username