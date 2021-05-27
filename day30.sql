⛓ Link:https://leetcode.com/problems/human-traffic-of-stadium/

/**
💻 List of Companies: Amazon, Adobe, Uber


🎯 Day 30-

Table: Stadium

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| visit_date    | date    |
| people        | int     |
+---------------+---------+
visit_date is the primary key for this table.
Each row of this table contains the visit date and visit id to the stadium with the number of people during the visit.
No two rows will have the same visit_date, and as the id increases, the dates increase as well.
 

Write an SQL query to display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each.

Return the result table ordered by visit_date in ascending order.

The query result format is in the following example.

 

Stadium table:
+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 1    | 2017-01-01 | 10        |
| 2    | 2017-01-02 | 109       |
| 3    | 2017-01-03 | 150       |
| 4    | 2017-01-04 | 99        |
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-09 | 188       |
+------+------------+-----------+

Result table:
+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-09 | 188       |
+------+------------+-----------+
The four rows with ids 5, 6, 7, and 8 have consecutive ids and each of them has >= 100 people attended. Note that row 8 was included even though the visit_date was not the next day after row 7.
The rows with ids 2 and 3 are not included because we need at least three consecutive ids.

**/

🏆 Solution:

with cte as
(
    select id, visit_date, people, id - row_number() over (order by id) as r
    from Stadium
    where people >= 100
),
cte2 as (
    select distinct r
    from cte
    group by r
    having count(*) >= 3
)

select a.id, a.visit_date, a.people 
from cte a
inner join cte2 b
on a.r = b.r
order by a.visit_date
;

/**
 📝 Explaination:
 
 I created a temporary table with a new column 'r', which stores the new id after subtracting row number.
 If there are consecutive id's the value of 'r' will be the same, so in he next step we group by 'r'.
 Then I created a second table where I group the data based on column 'r' and selected values that have count greater than 3.
 Lastly, I used inner join to get the final output
 
 **/
