 
SELECT name,
  CASE
    WHEN died IS NULL THEN 2022 - born
    ELSE died-born
  END AS AGE
FROM people
WHERE born >= 1900
ORDER BY AGE DESC, NAME
LIMIT 20;