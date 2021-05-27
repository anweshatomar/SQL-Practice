⛓ Link:

/**
💻 List of Companies: Amazon, Google


🎯 Day 29-

Table: Department

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| revenue       | int     |
| month         | varchar |
+---------------+---------+
(id, month) is the primary key of this table.
The table has information about the revenue of each department per month.
The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].
 

Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.

The query result format is in the following example:

Department table:
+------+---------+-------+
| id   | revenue | month |
+------+---------+-------+
| 1    | 8000    | Jan   |
| 2    | 9000    | Jan   |
| 3    | 10000   | Feb   |
| 1    | 7000    | Feb   |
| 1    | 6000    | Mar   |
+------+---------+-------+

Result table:
+------+-------------+-------------+-------------+-----+-------------+
| id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
+------+-------------+-------------+-------------+-----+-------------+
| 1    | 8000        | 7000        | 6000        | ... | null        |
| 2    | 9000        | null        | null        | ... | null        |
| 3    | null        | 10000       | null        | ... | null        |
+------+-------------+-------------+-------------+-----+-------------+

Note that the result table has 13 columns (1 for the department id + 12 for the months).

**/

🏆 Solutions:


Select
ID
, sum(Case When Month = 'Jan' Then Revenue End) as Jan_Revenue
, sum(Case When Month = 'Feb' Then Revenue End) as Feb_Revenue
, sum(Case When Month = 'Mar' Then Revenue End) as Mar_Revenue
, sum(Case When Month = 'Apr' Then Revenue End) as Apr_Revenue
, sum(Case When Month = 'May' Then Revenue End) as May_Revenue
, sum(Case When Month = 'Jun' Then Revenue End) as Jun_Revenue
, sum(Case When Month = 'Jul' Then Revenue End) as Jul_Revenue
, sum(Case When Month = 'Aug' Then Revenue End) as Aug_Revenue
, sum(Case When Month = 'Sep' Then Revenue End) as Sep_Revenue
, sum(Case When Month = 'Oct' Then Revenue End) as Oct_Revenue
, sum(Case When Month = 'Nov' Then Revenue End) as Nov_Revenue
, sum(Case When Month = 'Dec' Then Revenue End) as Dec_Revenue
From Department
Group By ID 


 📝 Explaination:
 
 I create 12 new columns for each month using the case statement, 
 I used sum() to add together the 'Revenue' values for each month based on the ID.
