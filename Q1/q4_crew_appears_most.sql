 
SELECT p.name AS NAME, COUNT(c.person_id) AS NUM_APPEARANCES
FROM people AS p
JOIN crew AS c ON p.person_id = c.person_id
GROUP BY p.name
ORDER BY NUM_APPEARANCES DESC
LIMIT 20;