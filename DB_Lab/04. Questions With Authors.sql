SELECT q.Title AS [Question Title], u.Username AS Author FROM Questions q
JOIN Users u
ON u.Id = q.UserId
ORDER BY q.Title ASC