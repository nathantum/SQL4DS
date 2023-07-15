-- Assume you're given two tables containing data about 
--Facebook Pages and their respective likes (as in "Like a Facebook Page").
-- Write a query to return the IDs of the Facebook pages that have zero likes. --The output should be sorted in ascending order based on the page IDs.

-- SOLUTION--
SELECT pg.page_id
FROM pages AS pg 
LEFT OUTER JOIN page_likes AS pl ON pg.page_id =  pl.page_id
WHERE pl.page_id IS NULL;
