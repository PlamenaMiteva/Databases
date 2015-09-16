SELECT t.TeamName AS [Team Name], 
l.LeagueName  AS League, 
ISNULL(c.CountryName, 'International') AS [League Country]
FROM Teams t
JOIN Leagues_Teams lt
ON t.Id = lt.TeamId
JOIN Leagues l
ON l.Id = lt.LeagueId
LEFT JOIN Countries c
ON c.CountryCode = l.CountryCode
ORDER BY t.TeamName


