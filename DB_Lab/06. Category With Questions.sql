SELECT c.Name AS Category, q.Title AS Question, q.CreatedOn FROM Questions q
RIGHT JOIN Categories c
ON q.CategoryId = c.Id
ORDER BY c.Name, q.Title ASC