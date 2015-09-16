(SELECT COUNT (a.TownId) AS AdsCount, ISNULL(t.Name, '(no town)') AS Town  FROM Towns t
RIGHT JOIN Ads a
ON a.TownId = t.Id
GROUP BY t.Name
HAVING COUNT(a.TownId) = 2 OR COUNT(a.TownId) = 3)
UNION
(SELECT COUNT (Id) AS AdsCount, ISNULL(CAST(TownId AS nvarchar(max)), '(no town)') AS Town FROM Ads
GROUP BY TownId
having TownId IS NULL)
ORDER BY Town