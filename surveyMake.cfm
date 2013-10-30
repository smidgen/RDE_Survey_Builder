<html> 
<head> 

<title>Insert Data Form</title> 
<script src="addInput.js" language="Javascript" type="text/javascript"></script>

</head> 
 
<body> 
<h2>Insert Data Form</h2> 


<form id="mainForm" action="Input_Form.cfm" method="post"> 
 

    Survey ID:
    <input type="Text" name="id" size="35" maxlength="50">
	<br>
	
   Survey Name:
    <input type="Text" name="Name" size="35" maxlength="50">

	<br>
	
	<div id="dynamicInput">
		<form id="nextForm" action"Input_Form.cfm" method="post">
			<br>
			Questions:
			<input type="button" value="Add another text input" onClick="addInput('dynamicInput');"> 
			<br>
    
		</form>
	</div>
<br>
&nbsp;
<input type="submit" onClick= "submit_form()" value="Submit" ;">&nbsp;<input type="Reset" value="Clear Form">


</form> 
  
</body> 
</html