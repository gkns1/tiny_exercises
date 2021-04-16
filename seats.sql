/* Write your T-SQL query statement below 
medium leetcode problem, 2 possible ways to solve it included.
*/
/*
WITH seats AS (SELECT lag(student) over (order by id asc) as lagst, lead(student) over (order by id asc) as leadst, student, id from seat)
SELECT 
id,
CASE WHEN id % 2 = 1 then coalesce(leadst,student) else lagst end as student
FROM seats
*/
SELECT
case 
when id % 2 = 1 and id < (select max(id) from seat) then id+1
when id % 2 = 0 then id-1
else id
end as id,
student
from seat
order by id asc
