<cfimport prefix="rde" taglib="../tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="builder" import="../">
</cfif>
<rde:security>
	

<script src="addInput.js" language="Javascript" type="text/javascript"></script>


<cfquery name="getSurveyid" datasource="#application.cfc#">

SELECT TOP 1 *
FROM dbo.Survey
ORDER BY id DESC

</cfquery>

</head> 
 
<body> 
<h2>Insert Data Form</h2> 


<form id="mainForm" action="Input_Form.cfm" method="post"> 
 

    Survey ID: <cfoutput query="getSurveyid">#id#</cfoutput>
	<br>
	
   Survey Name:
    <input type="Text" name="Name" size="35" maxlength="50">

	<br>
	
	<div id="dynamicInput">
		
			<br>
			Questions:
			<input type="button" value="Add a text input" onClick="addInput('dynamicInput', '1');"> 
			<input type="button" value="Add a checkbox input" onClick="addInput('dynamicInput', '2');">
			<input type="button" value="Add a radio button input" onClick="addInput('dynamicInput', '3');">
			<input type="button" value="Add a dropdown option" onClick="addInput('dynamicInput', '4');">
			<br>
		
		
	</div>
<br>
&nbsp;

<input type="hidden" id="counter" name="counter" value=""/>

<input type="hidden" id="responseCounter" name="responseCounter" value=""/>

<input type="submit" onClick= "submit_form()" value="Submit" ;">&nbsp;<input type="Reset" value="Clear Form">


</form> 
  
<cfif not url.isAJAX>
	<rde:header mode="end" page="index" import="../">
</cfif>