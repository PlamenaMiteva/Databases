SELECT TOP 50
a.Content AS [Answer Content], 
a.CreatedOn, 
u.Username AS [Answer Author],  
q.Title AS [Question Title], 
c.Name AS [Category Name] 
FROM Answers a
JOIN Questions q
ON q.Id = a.QuestionId
JOIN Categories c
ON c.Id = q.CategoryId
JOIN Users u
ON u.Id = a.UserId
ORDER BY c.Name, u.Username, a.CreatedOn 