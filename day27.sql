Link:https://leetcode.com/problems/classes-more-than-5-students/

/**
Day 27-

There is a table courses with columns: student and class

Please list out all classes which have more than or equal to 5 students.

For example, the table:

+---------+------------+
| student | class      |
+---------+------------+
| A       | Math       |
| B       | English    |
| C       | Math       |
| D       | Biology    |
| E       | Math       |
| F       | Computer   |
| G       | Math       |
| H       | Math       |
| I       | Math       |
+---------+------------+
Should output:

+---------+
| class   |
+---------+
| Math    |
+---------+
 

Note:
The students should not be counted duplicate in each course.

**/

Solution:

select distinct class  
from (select class, count(*)over(partition by class)as val 
from courses
     group by class, student)tb1
where val >= 5;
