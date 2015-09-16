SELECT s.TeamName AS TeamName, ISNULL(SUM(r.Goals),0) AS [Total Goals]
FROM
(SELECT t.TeamName AS Id, tm.HomeGoals AS Goals FROM TeamMatches tm
JOIN Leagues_Teams lt
ON lt.LeagueId = tm.LeagueId
JOIN Teams t
ON t.Id = lt.TeamId
WHERE t.Id = tm.HomeTeamId
GROUP BY t.TeamName, tm.HomeGoals
UNION ALL
SELECT t.TeamName AS Id, tm.AwayGoals AS Goals FROM TeamMatches tm
JOIN Leagues_Teams lt
ON lt.LeagueId = tm.LeagueId
JOIN Teams t
ON t.Id = lt.TeamId
WHERE t.Id = tm.AwayTeamId 
GROUP BY t.TeamName, tm.AwayGoals) r
RIGHT JOIN Teams s
ON s.TeamName = r.Id
GROUP BY s.TeamName 
ORDER BY 'Total Goals' DESC, s.TeamName ASC




