SELECT c.CountryName AS [Home Team], ct.CountryName AS [Away Team], i.MatchDate AS [Match Date] FROM InternationalMatches i
JOIN Countries c
ON c.CountryCode = i.HomeCountryCode
JOIN Countries ct
ON ct.CountryCode = i.AwayCountryCode
ORDER BY i.MatchDate DESC