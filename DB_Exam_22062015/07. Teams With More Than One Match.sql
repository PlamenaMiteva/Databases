SELECT t.TeamName AS Team, COUNT(t.TeamName) AS [Matches Count]
FROM

(SELECT HomeTeamId AS TeamID FROM TeamMatches
UNION ALL
SELECT AwayTeamId AS TeamID FROM TeamMatches
) r

JOIN Teams t
ON t.Id = r.TeamID
GROUP BY r.TeamID, t.TeamName
HAVING COUNT(t.TeamName) > 1
ORDER BY t.TeamName

