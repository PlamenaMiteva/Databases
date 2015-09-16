SELECT c.ContinentName, 
SUM(ct.AreaInSqKm) AS CountriesArea,
SUM(CAST(ct.Population AS BIGINT)) AS CountriesPopulation
FROM Continents c
JOIN Countries ct
ON ct.ContinentCode = c.ContinentCode
GROUP BY c.ContinentName
ORDER BY SUM(CAST(ct.Population AS BIGINT)) DESC
