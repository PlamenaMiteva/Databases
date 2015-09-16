CREATE VIEW AllAds AS
SELECT a.Id, 
a.Title, 
u.UserName AS Author, 
a.Date, 
t.Name AS Town,
c.Name AS Category,
s.Status 
FROM AspNetUsers u
LEFT JOIN Ads a
ON u.Id = a.OwnerId
LEFT JOIN Towns t
ON t.Id = a.TownId
LEFT JOIN Categories c
ON c.Id = a.CategoryId
LEFT JOIN AdStatuses s
ON s.Id = a.StatusId


