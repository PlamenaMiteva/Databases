SELECT c.CountryName, ct.ContinentName, COUNT(r.Id) AS RiversCount, 
ISNULL(SUM(r.Length),0) AS TotalLength FROM Countries c
LEFT JOIN Continents ct
ON ct.ContinentCode = c.ContinentCode
LEFT JOIN CountriesRivers cr
ON cr.CountryCode = c.CountryCode
LEFT JOIN Rivers r
ON r.Id = cr.RiverId
GROUP BY c.CountryName, ct.ContinentName
ORDER BY COUNT(r.Id) DESC, SUM(r.Length) DESC, c.CountryName ASC