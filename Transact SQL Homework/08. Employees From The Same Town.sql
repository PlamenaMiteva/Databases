DECLARE empCursor CURSOR READ_ONLY FOR
  SELECT t.Name, e.FirstName +' ' + e.LastName AS FullName FROM Employees e
  JOIN Addresses a
  ON a.AddressID = e.AddressID
  JOIN Towns t
  ON t.TownID = a.TownID
  GROUP BY t.Name, e.FirstName, e.LastName  

OPEN empCursor
DECLARE @town char(50), @name char(50)
FETCH NEXT FROM empCursor INTO @town, @name

WHILE @@FETCH_STATUS = 0
  BEGIN
    DECLARE newCursor CURSOR READ_ONLY FOR
    SELECT t.Name, e.FirstName +' ' + e.LastName AS FullName FROM Employees e
    JOIN Addresses a
    ON a.AddressID = e.AddressID
    JOIN Towns t
    ON t.TownID = a.TownID
    GROUP BY t.Name, e.FirstName, e.LastName
	HAVING t.Name = @town AND e.FirstName +' ' + e.LastName !=@name
    OPEN newCursor
    DECLARE @secTown char(50), @secName char(50)
    FETCH NEXT FROM newCursor INTO @secTown, @secName

	   WHILE @@FETCH_STATUS = 0
       BEGIN
	   PRINT @town + @name + @secName		   
	   FETCH NEXT FROM newCursor 
       INTO @secTown, @secName
	   END
	   CLOSE newCursor
       DEALLOCATE newCursor

    FETCH NEXT FROM empCursor 
    INTO @town, @name
  END

CLOSE empCursor
DEALLOCATE empCursor
