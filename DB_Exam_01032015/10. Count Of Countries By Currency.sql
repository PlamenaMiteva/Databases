SELECT cs.CurrencyCode, 
cs.Description AS Currency,
COUNT(c.CountryCode) AS NumberOfCountries
FROM Currencies cs
LEFT JOIN Countries c
ON c.CurrencyCode = cs.CurrencyCode
GROUP BY cs.CurrencyCode, cs.Description
ORDER BY COUNT(c.CountryCode) DESC, cs.Description ASC


