/**
Day 10-

Write a SQL query to get the nth highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.

+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+


**/

Failed Solution:

 with new_table as 
      (select Salary, row_number() 
       over (order by salary desc)row_num from Employee)
      select max(Distinct salary) from new_table 
      where row_num>=N
      
Solution:

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
     select distinct salary from(select salary, dense_rank() over (order by salary desc) as rnk
      from employee) as frnk
      where rnk=N
  );
END
