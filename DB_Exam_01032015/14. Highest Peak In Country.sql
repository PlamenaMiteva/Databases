(SELECT c.CountryName AS [Country], 
ISNULL(p.PeakName, '(no highest peak)') AS [Highest Peak Name],
ISNULL(p.Elevation,0) AS [Highest Peak Elevation],
ISNULL(m.MountainRange, '(no mountain)') AS [Mountain]
FROM Countries c 
LEFT JOIN MountainsCountries mc
ON mc.CountryCode = c.CountryCode
LEFT JOIN Mountains m
ON m.Id = mc.MountainId
LEFT JOIN Peaks p
ON p.MountainId = m.Id
WHERE p.Elevation = 
(SELECT ISNULL(MAX(ps.Elevation), 0) 
FROM MountainsCountries ms
LEFT JOIN Mountains mt
ON mt.Id = ms.MountainId
LEFT JOIN Peaks ps
ON ps.MountainId = mt.Id
WHERE c.CountryCode = ms.CountryCode
) 
GROUP BY c.CountryName, p.PeakName,p.Elevation, m.MountainRange
)
UNION
(SELECT a.CountryName AS [Country],
  '(no highest peak)' AS [Highest Peak Name],
  0 AS [Highest Peak Elevation],
  '(no mountain)' AS [Mountain]
FROM Countries a 
LEFT JOIN MountainsCountries b
ON b.CountryCode = a.CountryCode
LEFT JOIN Mountains l
ON l.Id = b.MountainId
LEFT JOIN Peaks t
ON t.MountainId = l.Id
WHERE t.Elevation IS NULL AND a.CountryName NOT IN 
(SELECT c.CountryName  
FROM Countries c 
LEFT JOIN MountainsCountries mc
ON mc.CountryCode = c.CountryCode
LEFT JOIN Mountains m
ON m.Id = mc.MountainId
LEFT JOIN Peaks p
ON p.MountainId = m.Id
GROUP BY c.CountryName
HAVING MAX(p.Elevation) IS NOT NULL
) 
)
ORDER BY c.CountryName, [Highest Peak Name]


