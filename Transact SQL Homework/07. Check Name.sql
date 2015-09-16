USE SoftUni
GO
CREATE FUNCTION fn_CheckName
  (@word nvarchar(50) )
RETURNS
@tmpTable TABLE 
(  
TownName char(50)
)
AS
BEGIN

DECLARE empCursor CURSOR READ_ONLY FOR
  SELECT Name FROM Towns
  
OPEN empCursor
DECLARE @town char(50)
FETCH NEXT FROM empCursor INTO @town

WHILE @@FETCH_STATUS = 0
  BEGIN
    DECLARE @count int, @total int, @letterCount int, @letter character(1)
    SELECT @total = LEN(@town), @count = 0, @letterCount = 0

     WHILE @count <= @total
     BEGIN
     SELECT @letter = substring(@town, @count, 1)
	 IF(@word LIKE '%' + @letter + '%')
	 BEGIN
	 SET @letterCount = @letterCount + 1
	 END     	 
     SELECT @count = @count + 1
     END
	 IF(@letterCount = LEN(@town))
	 BEGIN
	 INSERT INTO @tmpTable VALUES (@town)
	 END 
    FETCH NEXT FROM empCursor 
    INTO @town
  END

CLOSE empCursor
DEALLOCATE empCursor

RETURN
END



SELECT * FROM fn_CheckName (N'oistmiahf')

