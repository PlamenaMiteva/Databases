SELECT MIN(CreatedOn) AS MinDate, MAX(CreatedOn) AS MaxDate FROM Answers
WHERE year(CreatedOn) BETWEEN '2012' AND '2014'