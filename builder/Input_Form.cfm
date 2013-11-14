<html> 
<head> <title>Input form</title> </head> 
 
<body> 
 
 <cfset variables.Counter=FORM["counter"]>
 
 <cfset variables.responseCounter=FORM["responseCounter"]>
 
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

	<cfloop index="a" from= "1" to="4">
	
	<cfif isdefined('form.Question#i#_#a#')>
	
	<cfset variables.Question= FORM["Question"&i&"_"&a]>
	<cfquery datasource="ANDRE-LAPTOPSQLEXPRESS3" name="addQuestion" > 
	
	INSERT INTO dbo.Question (Question, Survey_id, Type_id)
	VALUES (<cfqueryparam value="#variables.Question#" cfsqltype="cf_sql_varchar"> , <cfqueryparam value="#Surveyid#" cfsqltype="cf_sql_int">, <cfqueryparam value="#a#" cfsqltype="cf_sql_int">)
	
	</cfquery>
	</cfif>
	
	</cfloop>
	
	<cfloop index="x" from="1" to="#variables.responseCounter#">
	
		<cfquery name="getQuestionid" datasource="ANDRE-LAPTOPSQLEXPRESS3">

		SELECT TOP 1 *
		FROM dbo.Question
		ORDER BY id DESC

		</cfquery>
	
	
		<cfoutput query="getQuestionid">
		<cfset Questionid = getQuestionid.id>
		</cfoutput>
		
		<cfif isdefined('form.Response#i#_#x#')>
		
				<cfset variables.Response= FORM["Response"&i&"_"&x]>
				
				<cfquery datasource="ANDRE-LAPTOPSQLEXPRESS3" name="addQuestion" > 
	
				INSERT INTO dbo.Options (Option_Text , Question_id)
				VALUES (<cfqueryparam value="#variables.Response#" cfsqltype="cf_sql_varchar">, <cfqueryparam value="#Questionid#" cfsqltype="cf_sql_int"> )
	
				</cfquery>
		</cfif>
	
	</cfloop>
	
	
	
	<cfoutput> #Form.Name# #variables.Question# </cfoutput> 
	
 </cfloop>
 
<h1>Survey Added</h1> 

</body> 
</html>