SELECT CountryName, CountryCode, 
CASE CurrencyCode WHEN 'EUR' THEN 'Inside' ELSE 'Outside' END
AS Eurozone FROM Countries
ORDER BY CountryName ASC