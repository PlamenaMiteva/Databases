SELECT [Home Team],[Away Team], [Match Date]
FROM
(SELECT t.TeamName AS [Home Team], t2.TeamName AS [Away Team], f.MatchDate AS [Match Date] FROM FriendlyMatches f
JOIN Teams t
ON t.Id = f.HomeTeamID 
JOIN Teams t2
ON t2.Id = f.AwayTeamId) f
UNION
(SELECT t.TeamName AS [Home Team], t2.TeamName AS [Away Team], m.MatchDate AS [Match Date] FROM TeamMatches m
JOIN Teams t
ON t.Id = m.HomeTeamID 
JOIN Teams t2
ON t2.Id = m.AwayTeamId
)
ORDER BY [Match Date] DESC