SELECT Top 10 a.Content AS Answer, a.CreatedOn, u.Username FROM Answers a
JOIN Users u 
ON u.Id = a.UserId
ORDER BY CreatedOn DESC
