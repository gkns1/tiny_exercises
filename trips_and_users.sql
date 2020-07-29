/* 
answer for the sql task with the lowest acceptance rate: https://leetcode.com/problems/trips-and-users/
- MS SQL Server code
- not exists would be better for large data sets
- in this task subqueries work faster, but are much less neat and legible 
- could be done with an inner join as well
- this answer is somewhere between the fastest and easiest to understand for the reader
*/
SELECT
Request_at as Day,
ROUND(CAST(SUM(IIF(Status != 'completed', 1, 0)) AS FLOAT) / COUNT(*), 2) AS [Cancellation Rate]
FROM Trips tps
WHERE Request_at between '2013-10-01' AND '2013-10-03'
AND Client_Id not in (select Users_Id from Users where Banned = 'Yes')
AND Driver_Id not in (select Users_Id from Users where Banned = 'Yes')
GROUP BY Request_at
