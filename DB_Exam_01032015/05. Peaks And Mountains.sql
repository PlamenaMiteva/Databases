SELECT p.PeakName, m.MountainRange AS Mountain, p.Elevation FROM Peaks p
JOIN Mountains m
ON p.MountainId = m.Id
ORDER BY Elevation DESC, p.PeakName