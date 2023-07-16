--Assume you're given a table Twitter tweet data, write a query to obtain 
--a histogram of tweets posted per user in 2022. Output the tweet count 
--per user as the bucket and the number of Twitter users who fall into that bucket.
--In other words, group the users by the number of tweets they posted in 2022
--and count the number of users in each group.

-- SOLUTION --
SELECT b AS tweet_bucket, COUNT(b) AS users_num
FROM (
  SELECT user_id, COUNT(*) as b
  FROM tweets
  WHERE EXTRACT(YEAR FROM tweet_date) = 2022
  GROUP BY user_id
) as a
GROUP BY b
ORDER BY b