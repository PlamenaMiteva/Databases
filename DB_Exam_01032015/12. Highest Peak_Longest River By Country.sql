SELECT c.CountryName, MAX(p.Elevation) AS HighestPeakElevation, MAX(ISNULL(r.Length,NULL)) AS LongestRiverLength FROM Countries c 
LEFT JOIN MountainsCountries mc
ON mc.CountryCode = c.CountryCode
LEFT JOIN Peaks p
ON p.MountainId = mc.MountainId
LEFT JOIN CountriesRivers cr
ON cr.CountryCode = c.CountryCode
LEFT JOIN Rivers r
ON r.Id = cr.RiverId
GROUP BY c.CountryName
ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, c.CountryName ASC