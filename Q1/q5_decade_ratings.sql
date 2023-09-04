 
WITH DecadeRatings AS (
  SELECT
    t.title_id,
    CAST(SUBSTR(t.premiered, 1, 3) || '0s' AS CHAR) AS DECADE,
    AVG(r.rating) AS AVG_RATING,
    MAX(r.rating) AS TOP_RATING,
    MIN(r.rating) AS MIN_RATING,
    COUNT(t.title_id) AS NUM_RELEASES
  FROM
    titles AS t
  JOIN
    ratings AS r ON t.title_id = r.title_id
  WHERE
    t.premiered IS NOT NULL
  GROUP BY
    Decade
)
SELECT
  Decade,
  ROUND(AVG_RATING, 2) AS AVG_RATING,
  TOP_RATING,
  MIN_RATING,
  NUM_RELEASES
FROM
  DecadeRatings
ORDER BY
  AVG_RATING DESC,
  Decade ASC;