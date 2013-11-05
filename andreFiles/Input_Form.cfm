<html> 
<head> <title>Input form</title> </head> 
 
<body> 
 
 <cfset variables.Counter=FORM["counter"]>
 
<cfquery datasource="ANDRE-LAPTOPSQLEXPRESS3" name="addSurvey" > 
	
	INSERT INTO dbo.Survey(Name)
	VALUES('#Form.Name#')
	
</cfquery>

<cfquery name="getSurveyid" datasource="ANDRE-LAPTOPSQLEXPRESS3">

SELECT TOP 1 *
FROM dbo.Survey
ORDER BY id DESC

</cfquery>

<cfoutput query="getSurveyid">
	<cfset Surveyid = getSurveyid.id>
</cfoutput>
 
<cfloop index="i" from="1" to="#variables.Counter#">

	<cfset variables.Question= FORM["Question"&i]>
	
	<cfquery datasource="ANDRE-LAPTOPSQLEXPRESS3" name="addQuestion" > 
	
	INSERT INTO dbo.Question (Question, Survey_id)
	VALUES (<cfqueryparam value="#variables.Question#" cfsqltype="cf_sql_varchar"> , <cfqueryparam value="#Surveyid#" cfsqltype="cf_sql_int">)
	
	</cfquery>
	
	<cfoutput> #Form.Name# #variables.Question# </cfoutput> 
	
 </cfloop>
 
<h1>Survey Added</h1> 

</body> 
</html>