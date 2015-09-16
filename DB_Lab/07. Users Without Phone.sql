SELECT u.Id, u.Username, u.FirstName, u.PhoneNumber, u.RegistrationDate, u.Email from Users u 
WHERE  u.Id NOT IN (select DISTINCT UserId from Questions) AND
u.PhoneNumber IS NULL
ORDER BY u.RegistrationDate
