 
WITH p AS (
    SELECT akas.title AS dubbed
    FROM titles
    INNER JOIN akas ON titles.title_id = akas.title_id
    WHERE titles.primary_title = 'House of the Dragon' AND titles.type = 'tvSeries'
    GROUP BY akas.title
    ORDER BY akas.title
)
SELECT GROUP_CONCAT(dubbed, ', ') AS concatenated_titles
FROM p;