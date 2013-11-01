<html> 
<head> <title>Input form</title> </head> 
 
<body> 
 
 <cfset variables.Counter=FORM["counter"]>
 
<cfquery datasource="ANDRE-LAPTOPSQLEXPRESS3" name="addSurvey" > 
	
	INSERT INTO dbo.Survey(Name)
	VALUES('#Form.Name#')
	
</cfquery>
 
<cfloop index="i" from="1" to="#variables.Counter#">

	<cfset variables.Question= FORM["Question"&i]>
	
	<cfquery datasource="ANDRE-LAPTOPSQLEXPRESS3" name="addQuestion" > 
	
	INSERT INTO dbo.Question (Question)
	VALUES (<cfqueryparam value="#variables.Question#" cfsqltype="cf_sql_varchar">)
	
	</cfquery>
	
	<cfoutput> #Form.Name# #variables.Question# </cfoutput> 
	
 </cfloop>
 
<h1>Survey Added</h1> 

</body> 
</html>