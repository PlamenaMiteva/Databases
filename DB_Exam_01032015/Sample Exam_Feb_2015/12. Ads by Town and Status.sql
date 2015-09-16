SELECT t.Name AS [Town Name], s.Status, COUNT(a.Id) AS Count FROM Ads a
LEFT JOIN AdStatuses s
ON s.Id = a.StatusId
JOIN Towns t
ON t.Id = a.TownId
GROUP BY t.Name, s.Status
ORDER BY t.Name, s.Status