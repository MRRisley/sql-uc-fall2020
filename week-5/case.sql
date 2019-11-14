/* CASE */

	/* Recall that: 
	1. CASE alters return values within the SELECT list.
	2. CASE logic is frequently applied at the record-level.
	3. GROUP BY with CASE is common. The entire CASE expression must appear in the GROUP BY.
	*/



/* Two-value CASE:

Table: humanresources.employee

1. Using the field vacationhours, return a column that classifies whether the value in the
	field is greater than or equal to 2 weeks (80 hours) or less than 2 weeks. Include the 
	BusinessEntityID field (as an employee ID #) as well as the original VacationHours field.
	Order results by most vacation remaining to least.
2. Using the logic from query 1, count the number of employees that fall within each bucket.
3. Examine the query in #1. What would happen if there were NULL values in the field VacationHours?
	Any ideas on how to avoid this?

*/


	/* Ex 1 */
	select 
	businessentityid as [emp_id],
	vacationhours,
	case when vacationhours >= 80 then 'GTE 2 wks'
		else 'LT 2 wks' end as [wks_vacation]
	from humanresources.employee
	order by vacationhours desc
	
	
	/* Ex 2 */
	select 
	case when vacationhours >= 80 then 'GTE 2 wks'
		else 'LT 2 wks' end as [wks_vacation],
	count(*) as [count]
	from humanresources.employee
	group by case when vacationhours >= 80 then 'GTE 2 wks'
		else 'LT 2 wks' end --no alias
	--Why must we drop BusinessEntityID and VacationHours from the SELECT list?
	
	
	/* Ex 3 */
	--Answer in class.





/* Multi-value CASE

Table: person.person

1. Using the field vacationhours, return a column that classifies whether the value in the
	field is greater than or equal to 2 weeks (80 hours), less than 2 weeks, or other. Include the 
	BusinessEntityID field (as an employee ID #) as well as the original VacationHours field.
	Order results by most vacation remaining to least.
2. Using #1 as a template, include another return value for when the vacation hours are between 1 and 2 weeks.

*/

	/* Ex 1 */
	select 
	businessentityid as [emp_id],
	vacationhours,
	case when vacationhours >= 80 then 'GTE 2 wks'
		when vacation hours < 80 then 'LT 2 wks' 
		else 'other' end as [wks_vacation]
	from humanresources.employee
	order by vacationhours desc
	--Mind the NULL! Note this is the safest way to treat your data.
	--Know your ELSE! Make sure you're sure you account for all possibilities.
	
	/* Ex 2 */
	--Complete in class.
	--Show why you do not need to use the AND operator.	
