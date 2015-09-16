
UPDATE Countries
SET IsDeleted = 'True'
FROM(
SELECT c.CountryName, COUNT(r.RiverName) AS Value FROM Countries c
JOIN CountriesRivers cr
ON cr.CountryCode = c.CountryCode
JOIN Rivers r
ON r.Id = cr.RiverId
GROUP BY c.CountryName
having COUNT(c.CountryName) > 3) r
WHERE r.CountryName = Countries.CountryName

SELECT m.Name AS Monastery, c.CountryName AS Country FROM Monasteries m
JOIN Countries c
ON c.CountryCode = m.CountryCode
WHERE c.IsDeleted = 'False'
ORDER BY m.Name