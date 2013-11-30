<cfimport prefix="rde" taglib="../tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header_builder mode="start" page="builder" import="../">
</cfif>
<rde:security>
	
<link rel="stylesheet" type="text/css" href="style.css" />

<script src="addInput.js" language="Javascript" type="text/javascript"></script>


<cfquery name="getSurveyid" datasource="ANDRE-LAPTOPSQLEXPRESS3">

SELECT TOP 1 *
FROM dbo.Survey
ORDER BY id DESC

</cfquery>

</head> 
 
<body> 
<h2>Survey Builder</h2> 


<form id="mainForm" action="Input_Form.cfm" method="post"> 
 

    Survey ID: <cfoutput query="getSurveyid">#id#</cfoutput>
	<br>
	<br>
   Survey Name:
   <br>
    <input type="Text" class="input-small" name="Name" size="35" maxlength="50">
	<br>
	<br>
	Survey Description:
	<br>
	<textarea type="Text" name="Description" size="35" maxlength="100"></textarea>
	<br>
	<br>
<div id="wrapper" style="min-height:100%">	
	<div id="dynamicInput">
		
			<br>
			
			Questions:
			<br>
			<button type="button" class="btn btn-primary btn-sm" onClick="addInput('dynamicInput', '1');">Add a text input </button>
			<button type="button" class="btn btn-primary btn-sm" onClick="addInput('dynamicInput', '2');">Add a checkbox input</button>
			<button type="button" class="btn btn-primary btn-sm" onClick="addInput('dynamicInput', '3');">Add a radio button input</button>
			<button type="button" class="btn btn-primary btn-sm" onClick="addInput('dynamicInput', '4');">Add a dropdown option</button>
			<button type="button" class="btn btn-primary btn-sm" onClick="addInput('dynamicInput', '5');">Add a Date field option</button>
			<br>
			<br>
		
	</div>
</div>
<br>
&nbsp;

<input type="hidden" id="counter" name="counter" value=""/>

<input type="hidden" id="responseCounter" name="responseCounter" value=""/>

<input type="hidden" id="randId" name="randId" value=""/>

<button type="submit" class="btn btn-primary btn-sm" onClick= "submit_form()" ;"> Submit </button>&nbsp;<button class="btn btn-danger btn-sm" type="Reset"> Clear Form </button>

</form>
 

 
</body>
  

<cfif not url.isAJAX>
	<rde:header_builder mode="end" page="index" import="../">
</cfif>

<div class ="container" style="min-height:20%; position:relative;" >
<div name ="footerTry" id="footerTry">
  
  <img style="height: 50px;display: block;margin: auto; position:absolute; bottom:0;" src="../assets/img/footer.png">
  
   </div>
  </div>