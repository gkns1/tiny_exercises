        /* Write your T-SQL query statement below. */
        /* leetcode medium Nth highest salary https://leetcode.com/problems/nth-highest-salary/ */
CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        SELECT DISTINCT Salary
        from 
        (select Salary, DENSE_RANK() OVER (Order By Salary desc) as rank from Employee) subq
        where rank = @N
    );
END
