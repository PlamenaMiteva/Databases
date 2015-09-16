IF OBJECT_ID('fn_MountainsPeaksJSON') IS NOT NULL
  DROP FUNCTION fn_MountainsPeaksJSON
GO
CREATE FUNCTION fn_MountainsPeaksJSON()
	RETURNS NVARCHAR(MAX)
AS
BEGIN

DECLARE empCursor CURSOR READ_ONLY FOR
  SELECT Id, MountainRange FROM Mountains 
 
OPEN empCursor
DECLARE @id int, @mountain nvarchar(max), @result nvarchar(max), @peak nvarchar(max), @height int, @counter int =0
FETCH NEXT FROM empCursor INTO @id, @mountain
SET @result = '{"mountains":['

WHILE @@FETCH_STATUS = 0
BEGIN
SET @result = @result + '{"name":"'+@mountain+'","peaks":['
DECLARE PeaksCursor CURSOR READ_ONLY FOR
  SELECT PeakName, Elevation FROM Peaks
  WHERE MountainId = @id  

OPEN PeaksCursor
FETCH NEXT FROM PeaksCursor INTO @peak, @height
WHILE @@FETCH_STATUS = 0
BEGIN
SET @result = @result + '{"name":"'+@peak+'","elevation":'+ CAST(@height AS char(4))+'},'
SET @counter = @counter + 1
FETCH NEXT FROM PeaksCursor INTO @peak, @height
END
CLOSE PeaksCursor
DEALLOCATE PeaksCursor

IF(@counter>0)
BEGIN
SET @result = SUBSTRING(@result, 1, LEN(@result)-1)
END
SET @counter = 0

SET @result = @result + ']},'
FETCH NEXT FROM empCursor 
    INTO @id, @mountain
END
SET @result = SUBSTRING(@result, 1, LEN(@result)-1) + ']}'

CLOSE empCursor
DEALLOCATE empCursor
RETURN @result
END
GO

SELECT dbo.fn_MountainsPeaksJSON()