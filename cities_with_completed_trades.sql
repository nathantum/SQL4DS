-- Assume you're given the tables containing completed trade orders and user details
-- in a Robinhood trading system. Write a query to retrieve the top three cities that 
-- have the highest number of completed trade orders listed in descending order.
-- Output the city name and the corresponding number of completed trade orders.

SELECT  users.city, COUNT(trades.status) AS total_orders
FROM users 
INNER JOIN trades
ON users.user_id = trades.user_id
GROUP BY trades.status, users.city
ORDER BY  COUNT(trades.status) DESC
LIMIT 3;