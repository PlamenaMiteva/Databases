SELECT p.PeakName, 
r.RiverName,
LOWER(p.PeakName)+LOWER(SUBSTRING(r.RiverName, 2, LEN(r.RiverName)-1)) AS Mix 
FROM Peaks p
JOIN Rivers r
ON SUBSTRING(r.RiverName, 1, 1)  = SUBSTRING(p.PeakName, LEN(p.PeakName), 1)
ORDER BY Mix