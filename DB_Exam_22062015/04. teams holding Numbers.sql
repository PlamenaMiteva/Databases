SELECT TeamName AS [Team Name], CountryCode AS [Country Code] FROM Teams
WHERE TeamName LIKE '%[0-9]%'
ORDER BY CountryCode ASC