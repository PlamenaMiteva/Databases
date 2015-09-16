SELECT f.LeagueName AS [League Name], f.Teams, s.Matches, ISNULL(s.[Average Goals],0) AS [Average Goals]
FROM
(SELECT l.LeagueName, COUNT(lt.LeagueId) AS Teams FROM Teams t
RIGHT JOIN Leagues_Teams lt
ON t.Id = lt.TeamId
RIGHT JOIN Leagues l
ON l.Id = lt.LeagueId
group by l.LeagueName) f
JOIN
(SELECT l.LeagueName, COUNT(tm.LeagueId) AS Matches,
AVG(tm.HomeGoals + tm.AwayGoals) AS [Average Goals]
FROM TeamMatches tm
RIGHT JOIN Leagues l
ON l.Id = tm.LeagueId
group by l.LeagueName) s
ON f.LeagueName = s.LeagueName
ORDER BY f.Teams DESC, s.Matches DESC