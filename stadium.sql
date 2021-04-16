/* hard leetcode database problem https://leetcode.com/problems/human-traffic-of-stadium/submissions/ */
/* Write your T-SQL query statement below */
/* CTE + window functions for good performance and ease of reading */
WITH cons as (
    SELECT id, 
    visit_date, 
    people, 
    lead(people) over (order by visit_date asc) as lead1, 
    lead(people,2) over (order by visit_date asc) as lead2,
    lag(people) over (order by visit_date asc) as lag1, 
    lag(people,2) over (order by visit_date asc) as lag2 
    from Stadium)
SELECT 
id, 
visit_date, 
people 
FROM cons
WHERE 
(people >= 100 and lead1 >= 100 and lead2 >= 100)
or (people >= 100 and lag1 >= 100 and lag2 >= 100)
or (people >= 100 and lag1 >= 100 and lead1 >= 100)
