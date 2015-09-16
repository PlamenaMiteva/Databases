UPDATE Countries
SET CountryName = 'Burma'
WHERE CountryName = 'Myanmar'

Select * from Countries
where CountryName = 'Burma'

INSERT INTO Monasteries
VALUES('Hanga Abbey', 'TZ')

INSERT INTO Monasteries
VALUES('Myin-Tin-Daik', 'MM')

DELETE FROM Monasteries
WHERE Name = 'Myin-Tin-Daik'

SELECT c.ContinentName, ct.CountryName, COUNT(m.Name) AS MonasteriesCount FROM Countries ct
JOIN Continents c
ON ct.ContinentCode = c.ContinentCode
LEFT JOIN Monasteries m
ON m.CountryCode = ct.CountryCode
WHERE ct.IsDeleted = 0
GROUP BY c.ContinentName, ct.CountryName
ORDER BY COUNT(m.Name) DESC, ct.CountryName ASC
