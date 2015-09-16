SELECT p.PeakName, m.MountainRange AS Mountain, c.CountryName, t.ContinentName FROM Peaks p
JOIN Mountains m
ON p.MountainId = m.Id
JOIN MountainsCountries mc
ON mc.MountainId = m.Id
JOIN Countries c
ON c.CountryCode = mc.CountryCode
JOIN Continents t
ON c.ContinentCode = t.ContinentCode
ORDER BY p.PeakName, c.CountryName 