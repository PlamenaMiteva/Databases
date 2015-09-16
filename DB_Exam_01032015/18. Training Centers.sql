select s.Name as 'traning center', 
t.start_date as 'start date', 
c.Name as 'course name',
IFNULL(c.Description, 'NULL') as 'more info'
from timetable t
JOIN training_centers s
ON s.Id = t.training_center_id
JOIN courses c
ON t.course_id = c.Id
order by t.start_date, t.Id



