<cfimport prefix="rde" taglib="../tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header_builder mode="start" page="builder" import="../">
</cfif>
<rde:security import="../">


<html>
 
<link rel="stylesheet" type="text/css" href="style.css" />

<head> <title>Input form</title> </head> 
 
<body> 
 
 <cfset variables.Counter=FORM["counter"]>
 
 <cfset variables.responseCounter=FORM["responseCounter"]>
 
 <cfset variables.randId=FORM["randId"]>
 

 
 
 
<cfquery datasource="#application.dataDSN#" name="addSurvey" > 
	
	INSERT INTO dbo.Survey(Name , surveyKey, Description)
	VALUES('#Form.Name#', '#randId#', '#Form.Description#')
	
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
				
				<cfquery datasource="ANDRE-LAPTOPSQLEXPRESS3" name="addQuestion" > 
	
				INSERT INTO dbo.Options (Option_Text , Question_id)
				VALUES (<cfqueryparam value="#variables.Response#" cfsqltype="cf_sql_varchar">, <cfqueryparam value="#Questionid#" cfsqltype="cf_sql_int"> )
	
				</cfquery>
		</cfif>
	
	</cfloop>
	
	
	
	<!---<cfoutput> #Form.Name# #variables.Question# #variables.randId#  </cfoutput> --->
	
 </cfloop>
 


<br>


 <div id="headerBorder2"> <h1>Survey Added!</h1> </div>


<br>
<br>
 <div id="headerBorder3"><h2>Survey Name is:</h2></div> <h3> <cfoutput> #Form.Name# </cfoutput> </h3>
<br>
<br>
 <div id="headerBorder3"><h2>Survey Description:</h2></div><br>
 
<h3><cfoutput>#Form.Description#</cfoutput></h3>

<br>
<br>
 <div id="headerBorder3"><h2>Questions Added:</h2></div> <br>
 
<cfloop index="i" from="1" to="#variables.Counter#">

	<cfloop index="a" from= "1" to="5">
	
		<cfif isdefined('form.Question#i#_#a#')>
		
		<cfset variables.Question= FORM["Question"&i&"_"&a]>
		<div class="questionBorder">
			<h2> <cfoutput> #variables.Question# </cfoutput> </h2>
			
			<br>
			<h3>Options:</h3>
			<cfloop index="x" from="1" to="#variables.responseCounter#">
			
			<cfif isdefined('form.Response#i#_#x#')>
		
		<cfset variables.Question= FORM["Response"&i&"_"&x]>
		
			 <cfoutput> #variables.Response# </cfoutput>
			
			<br>
			</cfif>
			</cfloop>
			
			<br>
			</div>
			<br>
			<br>
		</cfif>
		
		
		
	</cfloop>
	
</cfloop>

 <div id="headerBorder3"><h2>Survey Key:</h2></div> <h3><cfoutput> #variables.randId# </cfoutput></h3>

<br>

</body> 


<cfif not url.isAJAX>
	<rde:header_builder mode="end" page="index" import="../">
</cfif>

<div class ="container" style="min-height:20%; position:relative;" >
<div name ="footerTry" id="footerTry">
  
  <img style="height: 50px;display: block;margin: auto; position:absolute; bottom:0;" src="../assets/img/footer.png">
  
   </div>
  </div>
  
  </html>