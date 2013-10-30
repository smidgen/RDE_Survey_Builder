<html> 
<head> <title>Input form</title> </head> 
 
<body> 
 
<!--- Insert the new record ---> 
<cfinsert datasource="MSSQL" tablename="Survey"> 
 
<h1>Survey Added</h1> 
<cfoutput> You have added #Form.Question# with question id = #Form.Question_id# was added to #Form.id# to the database. 
</cfoutput> 
 
</body> 
</html>