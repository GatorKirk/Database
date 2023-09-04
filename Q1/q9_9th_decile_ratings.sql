WITH actor_movie_1955 AS (
    SELECT
        p.name,
        p.person_id,
        t.title_id,
        t.primary_title
    FROM
        people AS p
    JOIN
        crew AS c ON p.person_id = c.person_id
    JOIN
        titles AS t ON c.title_id = t.title_id
    WHERE
        p.born = 1955
        AND t.type = "movie"
),
actor_ratings AS (
     SELECT
          name,
          ROUND(AVG(ratings.rating), 2) as rating
     FROM ratings
     INNER JOIN actor_movie_1955 ON ratings.title_id = actor_movie_1955.title_id
     GROUP BY actor_movie_1955.person_id
),
deciles AS (
    SELECT
        NTILE(10) OVER (ORDER BY rating DESC) AS decile
    FROM
        actor_ratings
)

SELECT
    name,rating AS Result
FROM
    deciles
WHERE
    decile = 9
ORDER BY
    rating DESC,
    name;
