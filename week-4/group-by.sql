/* GROUP BY Clause */

	/* Recall that: 
	1. The GROUP BY clause lists items from the select list over which aggregations are performed.
	2. It always follows the WHERE clause (if it exists).
	3. The number of records returned is determined by the number of unique combinations of
		values among items within the GROUP BY.
	4. HAVING filters the results after aggregation. WHERE filters records before aggregation.
	5. You must refer to original field names in the GROUP BY and HAVING clause.
	*/



/* Aggregation without grouping.

1. How many records are in the table?
2. How many records are in the table that were modified after June 1, 2014?
3. How many records have a value of 'Cincinnati' for the field City?

*/

select count(*) as record_count from person.[address]

select count(*) as record_count 
from person.[address]
where modifieddate >= '6/1/2014'

select count(*) as record_count 
from person.[address]
where city='Cincinnati'


/* Aggregation with grouping by one item.

1. How many records exist for each StateProvinceID? Sort by StateProvinceID in ascending order.
2. What value of StateProvinceID has the most number of records?
3. How many records exist for each City with StateProvinceID of 14? Order by City in alphabetical order.

*/

select stateprovinceid, count(*) as record_count 
from person.[address]
group by stateprovinceid
order by stateprovinceid

select stateprovinceid, count(*) as record_count 
from person.[address]
group by stateprovinceid
--order by --complete

select city, count(*) as record_count 
from person.[address]
--where --complete
group by city
--order by --complete
--(1) What do we do if we want to include the StateProvinceID as part of the select list?
--(2) Would it make sense to include AddressLine1 in the query?




/* Aggregation with grouping by multiple items.

1. How many records exist for each StateProvinceID and City? Sort by StateProvinceID, then City in ascending order.
2. What value of City has the most number of records?
3. What value of StateProvinceID and City has the most number of records?

*/

select stateprovinceid, 
	city, 
	count(*) as record_count 
from person.[address]
group by stateprovinceid, city
order by stateprovinceid, city

select 
	city, 
	count(*) as record_count 
from person.[address]
group by city
--order by --complete

--complete #3 in class




/* Filtering aggregated records.

1. How many records exist for each StateProvinceID and City? Exlude State/City combination with fewer than 5 records.
	Sort by StateProvinceID, then City in ascending order.
2. How many records exist for each StateProvinceID and City with a City whose name begins with an A? 
	Only include State/City combination with 50-100 records.
	Sort by StateProvinceID, then City in ascending order.
*/


select stateprovinceid,
	city,
	count(*) as record_count
from person.[address]
group by stateprovinceid, city
	having count(*) >= 5
order by stateprovinceid, city


select stateprovinceid,
	city,
	count(*) as record_count
from person.[address]
--where --complete
group by stateprovinceid, city
--having --complete
order by stateprovinceid, city
