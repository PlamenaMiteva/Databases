INSERT INTO Towns(Name) VALUES ('Sofia'), ('Berlin'), ('Lyon')
UPDATE Users SET TownId = (SELECT Id FROM Towns WHERE Name='Sofia')
INSERT INTO Towns VALUES
('Munich'), ('Frankfurt'), ('Varna'), ('Hamburg'), ('Paris'), ('Lom'), ('Nantes')

UPDATE Users
SET TownID = 8
WHERE DATENAME(dw, RegistrationDate) = 'Friday'

UPDATE Questions
SET Title = 'Java += operator'
FROM
(SELECT q.Id FROM Answers a
JOIN Questions q
ON q.Id = a.QuestionId
WHERE (DATENAME(dw, a.CreatedOn) = 'Monday' OR DATENAME(dw, a.CreatedOn) = 'Sunday')
AND month(a.CreatedOn) = '02') r
WHERE r.Id = Questions.Id 

DELETE FROM Answers
WHERE Answers.Id 
IN (
SELECT Id FROM #AnswerIds
) 

INSERT INTO Questions VALUES
('Fetch NULL values in PDO query', 
'When I run the snippet, NULL values are converted to empty strings. How can fetch NULL values?', 
4, 32,
GETDATE())

SELECT t.Name AS Town, u.Username, COUNT(a.UserId) AS [AnswersCount] FROM Towns t
LEFT JOIN Users u
ON u.TownID = t.Id
LEFT JOIN Answers a
ON a.UserId = u.Id
GROUP BY t.Name, u.Username
ORDER BY [AnswersCount] DESC, u.Username ASC
