/* NULL */

	/* Recall that: 
	1. SQL has three possible values when evaluating logic: TRUE, FALSE, or NULL.
	2. NULL values represent missing/unknown data and cannot evaluate to TRUE or FALSE.
	3. Mostly an issue with negative statements. DOES NOT EQUAL will not return NULL values.
	*/



/*

Table: person.person

1. How many records in the table have a value other than 'Mr.'? Include NULL values. 
2. Count the number of records for each value in the field Title.
3. Count the number of records for each value in the field Title that does not have the value of 'Mr.' 
	Do not explicitly include NULL values.
4. Count the number of records for each value in the field Title that does not have the value of 'Mr.' 
	Include NULL values.

*/


	/* Ex 1 */
	select
	title,
	count(*) as record_count
	from person.person
	group by title


	/* Ex 2 */
	select 
	count(*) as record_count 
	from person.person
	where (title <> 'Mr.' or title is null)


	/* Ex 3 */
	select
	title,
	count(*) as record_count 
	from person.person
	where title <> 'Mr.'
	group by title


	/* Ex 4 */
	select
	title,
	count(*) as record_count 
	from person.person
	where (title <> 'Mr.' or title is null)
	group by title
