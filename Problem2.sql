-- Assume you're given two tables containing data about 
--Facebook Pages and their respective likes (as in "Like a Facebook Page").
-- Write a query to return the IDs of the Facebook pages that have zero likes. --The output should be sorted in ascending order based on the page IDs.

-- SOLUTION 1--
SELECT pg.page_id
FROM pages AS pg 
LEFT OUTER JOIN page_likes AS pl ON pg.page_id =  pl.page_id
WHERE pl.page_id IS NULL;


-- SOLUTION 2--
SELECT page_id
FROM pages
EXCEPT
SELECT page_id
FROM page_likes;

---- SOLUTION 3--: Using NOT IN` clause
SELECT page_id
FROM pages
WHERE page_id NOT IN (
  SELECT page_id
  FROM page_likes
  WHERE page_id IS NOT NULL
);

-- SOLUTION #4: Using NOT EXISTS clause
SELECT page_id
FROM pages
WHERE NOT EXISTS (
  SELECT page_id
  FROM page_likes AS likes
  WHERE likes.page_id = pages.page_id
;)
