/* WHERE Clause */

	/* Recall that: 
	1. The WHERE filters records using logic.
	2. It always follows the FROM clause.
	3. You must refer to original field names in the WHERE clause, but it
     is not required in the ORDER BY.
	*/

/* 
NOTE: there are many uses and examples of logic not shown here. But, these examples
cover roughly 85% of the fundamentals of my work queries. 
*/



/* WHERE with equivalance logic.

1. How many records exist in the [Person].[Person] table where the FirstName field is Aaron?
2. How many people received the email promotion coded 2 in the table?
3. What is the alphabetically first last name that received an email promotion coded 0?

*/

select * 
from adventureworks2017.person.person
where firstname = 'aaron'

	/* Notes:
	
	(1) WHERE clause always comes after the FROM clause.
	(2) SQL is not case sensitive by default.
	(3) Strings, or character values, are always enclosed in single quotations.
	
	*/


select * 
from adventureworks2017.person.person
where emailpromotion = 2
--Will the query work if we treat the number 2 as a string?

select * 
from adventureworks2017.person.person
where emailpromotion = 0
--Where should we put the ORDER BY?





/* WHERE with compound logic.

1. How many people with a first name of Michael received the email promotion coded 2 in the table?
2. How many people with a first name of Michael or Mark received the email promotion coded 2 in the table? 

*/

select * 
from adventureworks2017.person.person
where emailpromotion = 2
and firstname = 'michael'
--AND means that both conditions must be True.

select * 
from adventureworks2017.person.person
where emailpromotion = 2
and firstname = 'michael'
or firstname = 'mark'
--OR means that at least one condition must be True.

select * 
from adventureworks2017.person.person
where firstname = 'michael'
or firstname = 'mark'
and emailpromotion = 2
--Does order matter?

select * 
from adventureworks2017.person.person
where (firstname = 'michael'
or firstname = 'mark')
and emailpromotion = 2
--ALWAYS put quotations around your OR logic!
--Go through each example to explain why all 3 return something different.
--This becomes VERY important with NULL values (more later).

select * 
from adventureworks2017.person.person
where firstname in ('michael', 'mark')
and emailpromotion = 2
--IN keyword can be a more straightforward solution for most OR logic.





/* WHERE with non-equivalance logic.

1. How many records exist in the [Person].[Person] table where the FirstName field is not Aaron?
2. How many people did not receive the email promotion coded 2 in the table?
3. How many people received the email promotion coded 2 in the table who were not named Michael or Mark? 

*/

select * 
from adventureworks2017.person.person
where firstname <> 'michael'
-- <> does not equal
-- != will work as well

select * 
from adventureworks2017.person.person
where emailpromotion != 2

select * 
from adventureworks2017.person.person
where emailpromotion = 2
and not (firstname = 'michael' or firstname = 'mark') 
-- note the parentheses around the OR logic
-- NOT before the or logic negates it

select * 
from adventureworks2017.person.person
where emailpromotion = 2
and firstname not in ('michael', 'mark')





/* WHERE with comparison logic.

1. How many records in the [Person].[Person] table have a BusinessEntityID greater than 1000?
2. How many records in the [Person].[Person] table were modified on or after January 1, 2014?
3. How many records in the [Person].[Person] table were modified in 1Q2014?
4. How many records in the [Person].[Person] table were not modified in 1Q2014?

*/

select * 
from adventureworks2017.person.person
where businessentityid > 1000


select * 
from adventureworks2017.person.person
where modifieddate >= '1/1/2014'
--note: dates use single quotations as well


select * 
from adventureworks2017.person.person
where modifieddate >= '1/1/2014'
and modifieddate < '4/1/2014'

select * 
from adventureworks2017.person.person
where modifieddate between '1/1/2014' and '3/31/2014'
--between works will with dates


select * 
from adventureworks2017.person.person
where modifieddate < '1/1/2014'
and modifieddate >= '4/1/2014'

select * 
from adventureworks2017.person.person
where modifieddate not between '1/1/2014' and '3/31/2014'





/* 
You Try

Use the Person table in the Person schema.

1. How many records does the table contain?
2. How many fields does the table contain?
3. What are the first 10 records alphabetically for the FirstName field? Return only the FirstName field in the output.
4. What does the result in (3.) tell us about "typical" data?
5. Copy/paste the query from (3.). Edit the query to select the first 100 records and add the LastName field to the output. 
6. Referring to the output from the query in (5.), is the LastName field sorted in the output? Should we expect it to be?
7. Copy/paste the query from (5.). Edit the query to order first by LastName and then by FirstName. 

If you finish early: using Google, try to find if the [Person].[Person] table is indexed and on what fields.

*/
