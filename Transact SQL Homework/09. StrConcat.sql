USE SoftUni
GO
CREATE FUNCTION fn_StrConcat (@test nvarchar(50))
RETURNS
@tmpTable TABLE 
(  
Result nvarchar(max)
)
AS
BEGIN
DECLARE @separator varchar(max)
DECLARE  @str nvarchar(max)
SET @separator = '+ '''' + '
DECLARE @Splited TABLE(id int IDENTITY(1,1), item varchar(50))
SET @test = REPLACE(@test, @separator, ''' UNION ALL SELECT ''')
SET @test = ' SELECT  ''' + @test + '''  '
INSERT INTO @Splited
EXEC(@test)

SELECT @str = COALESCE(@str + ',+','+ ', '') + item 
FROM @Splited
WHERE item IS NOT NULL

DECLARE empCursor CURSOR READ_ONLY FOR
  SELECT @str AS [Full] FROM Employees
  
OPEN empCursor
DECLARE @output char(50)
FETCH NEXT FROM empCursor INTO @output
WHILE @@FETCH_STATUS = 0
  BEGIN
  INSERT INTO @tmpTable VALUES(@output)
   FETCH NEXT FROM empCursor 
   INTO @output
  END
  CLOSE empCursor
DEALLOCATE empCursor
RETURN
END

SELECT * FROM fn_StrConcat(N'FirstName + '''' + LastName')



