BEGIN TRAN 
DROP TABLE EmployeesProjects 
ROLLBACK 
SELECT * FROM EmployeesProjects 


--If DROP TABLE was executed inside the Transaction and it has not been committed then 
--it can be restored by ROLLBACK. But if it isn't, then you need backup of your database. 
--Recover your table from database. If backup is also not present, then search 
--for 3rd party recovery tools.