
-- Assume you're given a table containing job postings from various companies on the
-- LinkedIn platform.
-- Write a query to retrieve the count of companies that have posted duplicate job listings.
-- Definition:
-- Duplicate job listings are defined as two job listings within the same company that 
-- share identical titles and descriptions.


-- SOLUTION---
SELECT COUNT(*) AS duplicate_companies FROM
(SELECT company_id, title, description, COUNT(job_id) AS duplicateS 
FROM job_listings
GROUP BY company_id,title, description
HAVING  COUNT(*) > 1) AS results;