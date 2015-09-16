SELECT c.CountryName AS [Country Name], 
COUNT(DISTINCT im.Id) + COUNT(DISTINCT i.Id) AS [International Matches],
COUNT(DISTINCT tm.Id) AS [Team Matches]
FROM Countries c
LEFT JOIN InternationalMatches im
ON im.HomeCountryCode = c.CountryCode 
LEFT JOIN InternationalMatches i
ON i.AwayCountryCode = c.CountryCode
LEFT JOIN Leagues l
ON l.CountryCode = c.CountryCode
LEFT JOIN TeamMatches tm
ON l.Id = tm.LeagueId
GROUP BY c.CountryName
HAVING (COUNT(DISTINCT im.Id) + COUNT(DISTINCT i.Id) > 0 OR COUNT(DISTINCT tm.Id) > 0)
ORDER BY [International Matches] DESC, [Team Matches] DESC, c.CountryName ASC