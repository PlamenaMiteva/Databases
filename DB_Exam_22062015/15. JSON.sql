CREATE FUNCTION fn_JSON()
	RETURNS NVARCHAR(MAX)
AS
BEGIN

DECLARE empCursor CURSOR READ_ONLY FOR
  SELECT Id, TeamName FROM Teams
  WHERE CountryCode = 'BG'   
  ORDER BY TeamName ASC
 
OPEN empCursor
DECLARE @id int, @team nvarchar(max), @result nvarchar(max),
@homeId int, @awayId int, @homeGoals int, @awayGoals int, @date datetime, @homeTeamName nvarchar(max), @awayTeamName nvarchar(max), @counter int =0
FETCH NEXT FROM empCursor INTO @id, @team
SET @result = '{"teams":['

WHILE @@FETCH_STATUS = 0
BEGIN
SET @result = @result+ '{"name":"'+ @team +'","matches":['

DECLARE Matches CURSOR READ_ONLY FOR
  SELECT t.HomeTeamId, t.AwayTeamId, t.HomeGoals, t.AwayGoals, t.MatchDate, s.TeamName, c.TeamName FROM TeamMatches t
  JOIN Teams s
  ON s.Id = t.HomeTeamId
  JOIN Teams c
  ON c.Id = t.AwayTeamId    
  WHERE MatchDate IS NOT NULL AND s.CountryCode = 'BG'
  ORDER BY t.MatchDate DESC
OPEN Matches
FETCH NEXT FROM Matches INTO @homeId, @awayId, @homeGoals, @awayGoals, @date, @homeTeamName, @awayTeamName
WHILE @@FETCH_STATUS = 0
BEGIN
IF(@homeId=@id OR @awayId=@id)
BEGIN
SET @result = @result + '{"'+@homeTeamName+'":'+ CAST(@homeGoals AS nvarchar(5))+',"'+@awayTeamName+'":'+CAST(@awayGoals AS nvarchar(5))+',"date":'+CONVERT(VARCHAR(24),@date,103)+'},'
SET @counter = @counter + 1
END
FETCH NEXT FROM Matches INTO @homeId, @awayId, @homeGoals, @awayGoals, @date, @homeTeamName, @awayTeamName
END
CLOSE Matches
DEALLOCATE Matches

IF(@counter>0)
BEGIN
SET @result = SUBSTRING(@result, 1, LEN(@result)-1)
END
SET @counter = 0

SET @result = @result + ']},'
FETCH NEXT FROM empCursor 
    INTO @id, @team
END
SET @result = SUBSTRING(@result, 1, LEN(@result)-1) + ']}'

CLOSE empCursor
DEALLOCATE empCursor
RETURN @result
END
GO

SELECT dbo.fn_JSON()