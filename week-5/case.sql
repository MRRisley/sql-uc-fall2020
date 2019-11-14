/* CASE */

	/* Recall that: 
	1. CASE alters return values within the SELECT list.
	2. CASE logic is frequently applied at the record-level.
	3. GROUP BY with CASE is common. The entire CASE expression must appear in the GROUP BY.
	*/



/* Two-value CASE:

Table: humanresources.employee

1. Using the field vacationhours, return a column that classifies whether the value in the
	field is greater than or equal to 2 weeks (80 days) or less than. Include the 
	BusinessEntityID field (as an employee ID #) as well as the original VacationHours field.
	Order results by most vacation remaining to least.

*/


	/* Ex 1 */
	select 
	businessentityid as [emp_id],
	vacationhours,
	case when vacationhours >= 80 then 'GTE 2 wks'
		else 'LT 2 wks' end as [wks_vacation]
	from humanresources.employee
	order by vacationhours desc
	
	
	
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
