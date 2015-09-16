SELECT 
t1.TeamName AS [Home Team], 
tm.HomeGoals AS [Home Goals], 
t2.TeamName AS [Away Team], 
tm.AwayGoals AS [Away Goals], 
l.LeagueName AS [League Name] 
FROM TeamMatches tm
JOIN Teams t1
ON t1.Id = tm.HomeTeamId
JOIN Teams t2
ON t2.Id = tm.AwayTeamId
JOIN Leagues l
ON l.Id = tm.LeagueId
WHERE tm.MatchDate > '10-Apr-2015'
ORDER BY l.LeagueName ASC, tm.HomeGoals DESC, tm.AwayGoals DESC