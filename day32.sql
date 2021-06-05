⛓ Link: https://leetcode.com/problems/shortest-distance-in-a-plane/

/**

🎯 Day 32: 

Table point_2d holds the coordinates (x,y) of some unique points (more than two) in a plane.
 

Write a query to find the shortest distance between these points rounded to 2 decimals.
 

| x  | y  |
|----|----|
| -1 | -1 |
| 0  | 0  |
| -1 | -2 |
 

The shortest distance is 1.00 from point (-1,-1) to (-1,2). So the output should be:
 

| shortest |
|----------|
| 1.00     |
 

Note: The longest distance among all the points are less than 10000.

**/

🏆 Solution: 

select min(distance) as shortest
from
(select round(sqrt(power(p1.x - p2.x, 2) + power(p1.y - p2.y, 2)), 2) as distance
from
point_2d p1 join point_2d p2 on p1.x != p2.x or p1.y != p2.y
) as temp
