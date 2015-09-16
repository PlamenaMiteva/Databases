SELECT a1.Date AS [FirstDate], a2.Date AS [SecondDate]
FROM Ads a1, Ads a2
WHERE
  a2.Date > a1.Date AND
  DATEDIFF(hour, a1.Date, a2.Date) < 12
ORDER BY a1.Date ASC, a2.Date ASC