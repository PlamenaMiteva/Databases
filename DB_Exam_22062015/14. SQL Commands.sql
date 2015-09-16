ALTER TABLE Leagues
ADD IsSeasonal bit NOT NULL DEFAULT('False')
GO


INSERT INTO TeamMatches
VALUES  
(60, 70, 2, 2, '19-Apr-2015 16:00', 2)

INSERT INTO TeamMatches
VALUES  
(66, 64, 0,0, '19-Apr-2015 21:45', 2)


UPDATE Leagues
SET IsSeasonal = 'True'
WHERE Id = 1 OR Id=2 OR id=4 OR Id = 5

