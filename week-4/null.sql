/* NULL */

	/* Recall that: 
	1. The GROUP BY clause lists items from the select list over which aggregations are performed.
	2. It always follows the WHERE clause (if it exists).
	3. The number of records returned is determined by the number of unique combinations of
		values among items within the GROUP BY.
	4. HAVING filters the results after aggregation. WHERE filters records before aggregation.
	5. You must refer to original field names in the GROUP BY and HAVING clause.
	*/



/* Aggregation without grouping.

Table: person.[address]

1. How many records are in the table?
2. How many records are in the table that were modified after June 1, 2014?
3. How many records have a value of 'Cincinnati' for the field City?

*/

	/* Ex 1 */
	select count(*) as record_count from person.[address]


	/* Ex 2 */
	select count(*) as record_count 
	from person.[address]
	where modifieddate >= '6/1/2014'


	/* Ex 3 */
	select count(*) as record_count 
	from person.[address]
	where city='Cincinnati'



