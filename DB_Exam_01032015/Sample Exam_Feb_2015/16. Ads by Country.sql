UPDATE Ads
SET TownId = 29
WHERE DATENAME(dw, Date) = 'Friday'


UPDATE Ads
SET TownId = 28
WHERE DATENAME(dw, Date) = 'Thursday'

DELETE FROM Ads
WHERE Ads.Id IN
(SELECT a.Id FROM Ads a
JOIN AspNetUsers u
ON u.Id = a.OwnerId
JOIN AspNetUserRoles n
ON n.UserId = u.Id
JOIN AspNetRoles r
ON r.Id = n.RoleId
WHERE r.Name = 'Partner'
)

INSERT INTO Ads
VALUES ('Free Book', 'Free C# Book', NULL, '39b7333d-664b-428d-9e11-4cde699d5e5e',
NULL, NULL, GETDATE(), 2)




(SELECT 
t.Name AS Town, 
c.Name AS Country,
COUNT(a.TownId) AS AdsCount
FROM Towns t
LEFT JOIN Countries c
ON c.Id = t.CountryId
LEFT JOIN Ads a
ON a.TownId = t.Id
GROUP BY t.Name, c.Name) 
UNION
(SELECT
NULL AS Town, 
NULL AS Country, 
COUNT(Id) AS AdsCount
FROM Ads 
WHERE TownId IS NULL)
ORDER BY Town, Country