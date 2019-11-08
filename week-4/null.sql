/* NULL */

	/* Recall that: 
	1. SQL has three possible values when evaluating logic: TRUE, FALSE, or NULL.
	2. NULL values represent missing/unknown data and cannot evaluate to TRUE or FALSE.
	3. Mostly an issue with negative statements. DOES NOT EQUAL will not return NULL values.
	*/



/* The NULL

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

	/* OR */

	select
	title,
	count(*) as record_count 
	from person.person
	group by title having title <> 'Mr.'
	--how might this impact the query plan?
	

	/* Ex 4 */
	select
	title,
	count(*) as record_count 
	from person.person
	where (title <> 'Mr.' or title is null)
	group by title
	
	
/* isnull()

Table: person.person

1. Count the number of records for each value in the field Title. 
	Use the isnull() function to return the value 'unknown' for NULL.

*/

	/* Ex 1 */
	select
	isnull(title, 'unknown'),
	count(*) as record_count
	from person.person
	group by isnull(title, 'unknown')





/* nullif */

select 1/0
--error

select 1/nullif(0, 0)
--nullif(0, 0) returns NULL

select 1/null
--1 divided by NULL is NULL
