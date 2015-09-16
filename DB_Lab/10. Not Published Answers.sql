SELECT a.Content AS [Answer Content], q.Title AS Question, c.Name AS Category FROM Answers a
JOIN Questions q
ON q.Id = a.QuestionId
JOIN Categories c
ON c.Id = q.CategoryId
WHERE IsHidden = 1 AND year(a.CreatedOn) = '2015' AND month(a.CreatedOn) = '01'
ORDER BY c.Name