SELECT s.Status, COUNT(a.StatusId) AS Count FROM AdStatuses s
JOIN Ads a
ON s.Id = a.StatusId
GROUP BY s.Status