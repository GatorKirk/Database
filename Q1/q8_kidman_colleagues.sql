 
SELECT DISTINCT p.name
FROM people AS p
WHERE p.person_id IN (
    SELECT DISTINCT c.person_id
    FROM crew AS c
    WHERE c.title_id IN (
        SELECT DISTINCT title_id
        FROM crew
        WHERE person_id = (
            SELECT person_id
            FROM people
            WHERE name = 'Nicole Kidman' AND born=1967
        )
    )
    AND (c.category = 'actor' OR c.category = 'actress')
)
ORDER BY p.name;