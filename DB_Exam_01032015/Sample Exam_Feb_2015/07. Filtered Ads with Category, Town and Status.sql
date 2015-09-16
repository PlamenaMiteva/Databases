SELECT a.Title, c.Name AS CategoryName, t.Name AS TownName, s.Status FROM Ads a
LEFT JOIN Categories c
ON c.Id = a.CategoryId
LEFT JOIN Towns t
ON t.Id = a.TownId
LEFT JOIN AdStatuses s
ON s.Id = a.StatusId
WHERE Status = 'Published' AND
(t.Name = 'Sofia' OR t.Name = 'Stara Zagora' OR t.Name = 'Blagoevgrad')
ORDER BY a.Title