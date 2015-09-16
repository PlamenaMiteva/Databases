INSERT INTO WorkHours (WorkDate, Task, WorkHours, EmployeeID)
VALUES ('2015-07-01', 'clean the office' ,'12:22' , 23)

INSERT INTO WorkHours (WorkDate, Task, WorkHours, EmployeeID)
VALUES ('2015-06-08', 'write JavaScript application' ,'07:34' , 56)

INSERT INTO WorkHours (WorkDate, Task, WorkHours, EmployeeID)
VALUES ('2015-05-31', 'check homeworks' ,'02:45' , 108)

INSERT INTO WorkHours (WorkDate, Task, WorkHours, EmployeeID)
VALUES ('2015-05-10', 'write a financial report' ,'11:52' , 1)

INSERT INTO WorkHours (WorkDate, Task, WorkHours, EmployeeID)
VALUES ('2015-02-15', 'check the advertising budget' ,'09:18' , 29)

UPDATE WorkHours
SET Task = 'chech all PHP homeworks'
WHERE EmployeeID = 108

DELETE FROM WorkHours
WHERE Task='check the advertising budget' AND EmployeeID = 29