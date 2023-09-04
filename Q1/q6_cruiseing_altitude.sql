 
SELECT t.primary_title AS Work, r.votes AS Votes
FROM titles AS t
JOIN crew AS c ON t.title_id = c.title_id
JOIN people AS p ON c.person_id = p.person_id
JOIN ratings AS r ON t.title_id = r.title_id
WHERE p.name LIKE'%Cruise%' AND p.born =1962
ORDER BY r.votes DESC
LIMIT 10;
