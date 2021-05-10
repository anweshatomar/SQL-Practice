/** 
Day 7 #30daysofSQL challenge - 

Table: Logs
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
id is the primary key for this table.

 
Write an SQL query to find all numbers that appear at least three times consecutively.
Return the result table in any order.
The query result format is in the following example:
 
Logs table:
+----+-----+
| Id | Num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+

Result table:
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
1 is the only number that appears consecutively for at least three times.
**/

Solution:

select distinct Num as 'ConsecutiveNums' from
(
    select Id - LAG(Id,2) Over(partition by Num order by Num,Id) as 'cid', Num
    from Logs
)tab
where cid=2;
