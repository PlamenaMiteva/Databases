SELECT a.Id, a.Title, a.Date, s.Status FROM Ads a
JOIN AdStatuses s
ON s.id = a.StatusId
WHERE s.Status <> 'Published' AND year(a.Date) = '2014'
ORDER BY a.Id