CREATE FUNCTION fn_CalcIntrest(
@sum decimal(18,2),
@intrestRate decimal(5,2),
@months int) 
RETURNS decimal(18,2)
AS
BEGIN
DECLARE @numberOfMonths numeric(38) = 1
WHILE (@numberOfMonths <= @months)
  BEGIN
    SET @sum = @sum + (@sum * @intrestRate/100)
    SET @numberOfMonths = @numberOfMonths + 1
  END

  RETURN @sum
END


