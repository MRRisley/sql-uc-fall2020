/* WHERE Clause */

	/* Recall that: 
	1. The WHERE filters records using logic.
	2. It always follows the FROM clause.
	3. You must refer to original field names in the WHERE clause, but it
     is not required in the ORDER BY.
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





/* WHERE with 

1. How many people with a first name of Michael received the email promotion coded 2 in the table?
2. How many people with a first name of Michael or Mark received the email promotion coded 2 in the table? 

*/





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
