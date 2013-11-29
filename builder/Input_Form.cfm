<cfimport prefix="rde" taglib="../tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="builder" import="../">
</cfif>
<rde:security import="../">


<html>

<link rel="stylesheet" type="text/css" href="style.css" />

<head> <title>Input form</title> </head>

<body>

 <cfset variables.Counter=FORM["counter"]>

 <cfset variables.responseCounter=FORM["responseCounter"]>

 <cfset variables.randId=FORM["randId"]>




<cfquery datasource="#application.dataDSN#" name="addSurvey">
	INSERT INTO dbo.Survey(Name , surveyKey)
	VALUES('#Form.Name#', '#randId#');

	SELECT SCOPE_IDENTITY() AS id;
</cfquery>

<cfset Surveyid = addSurvey.id>


<!---<cfset variables.uniqueId = randId & Surveyid>--->



<cfloop index="i" from="1" to="#variables.Counter#">

	<cfloop index="a" from= "1" to="5">

	<cfif isdefined('form.Question#i#_#a#')>

	<cfset variables.Question= FORM["Question"&i&"_"&a]>
	<cfquery datasource="#application.dataDSN#" name="addQuestion" >

	INSERT INTO dbo.Question (Question, Survey_id, Type_id)
	VALUES (<cfqueryparam value="#variables.Question#" cfsqltype="cf_sql_varchar"> , <cfqueryparam value="#Surveyid#" cfsqltype="cf_sql_int">, <cfqueryparam value="#a#" cfsqltype="cf_sql_int">)

	</cfquery>
	</cfif>

	</cfloop>

	<cfloop index="x" from="1" to="#variables.responseCounter#">

		<cfquery name="getQuestionid" datasource="#application.dataDSN#">

		SELECT TOP 1 *
		FROM dbo.Question
		ORDER BY id DESC

		</cfquery>


		<cfoutput query="getQuestionid">
		<cfset Questionid = getQuestionid.id>
		</cfoutput>

		<cfif isdefined('form.Response#i#_#x#')>

				<cfset variables.Response= FORM["Response"&i&"_"&x]>

				<cfquery datasource="#application.dataDSN#" name="addQuestion" >

				INSERT INTO dbo.Options (Option_Text , Question_id)
				VALUES (<cfqueryparam value="#variables.Response#" cfsqltype="cf_sql_varchar">, <cfqueryparam value="#Questionid#" cfsqltype="cf_sql_int"> )

				</cfquery>
		</cfif>

	</cfloop>



	<!---<cfoutput> #Form.Name# #variables.Question# #variables.randId#  </cfoutput> --->

 </cfloop>

<h1>Survey Added</h1>

<br>

Survey Name is: <cfoutput> #Form.Name# </cfoutput>

<br>
Questions Added: <br>
<cfloop index="i" from="1" to="#variables.Counter#">
	<cfloop index="a" from= "1" to="5">

		<cfif isdefined('form.Question#i#_#a#')>

		<cfset variables.Question= FORM["Question"&i&"_"&a]>

			 <cfoutput> #variables.Question# </cfoutput>

			<br>

		</cfif>



	</cfloop>

</cfloop>

Survey Key: <cfoutput> #variables.randId# </cfoutput>

<br>

</body>
</html>

<cfif not url.isAJAX>
	<rde:header mode="end" page="index" import="../">
</cfif>
