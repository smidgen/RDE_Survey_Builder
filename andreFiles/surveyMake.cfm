<html> 
<head> 

<title>Insert Data Form</title> 

<script src="jquery.js"></script>
<script src="test.js"></script>

<script src="addInput.js" language="Javascript" type="text/javascript"></script>


<cfquery name="getSurveyid" datasource="ANDRE-LAPTOPSQLEXPRESS3">

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
			<input type="button" value="Add another text input" onClick="addInput('dynamicInput', '1');"> 
			<input type="button" value="Add another checkbox input" onClick="addInput('dynamicInput', '2');">
			<input type="button" value="Add another radio button input" onClick="addInput('dynamicInput', '3');">
			<br>
		
		
	</div>
<br>
&nbsp;

<input type="hidden" id="counter" name="counter" value=""/>

<input type="submit" onClick= "submit_form()" value="Submit" ;">&nbsp;<input type="Reset" value="Clear Form">


</form> 
  
</body> 
</html