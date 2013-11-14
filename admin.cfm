<cfimport prefix="rde" taglib="tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="admin" >
</cfif>
<style>
	.tablebutton{
		width: 80px;
	}
	a:link {color:#000;text-decoration:none;}      /* unvisited link */
a:visited {color:#000;text-decoration:none;}  /* visited link */
a:hover {color:#000;text-decoration:none;}  /* mouse over link */
a:active {color:#000;text-decoration:none;}  /* selected link */
</style>
<rde:security>
<div class="page-header">
  <h1>Surveys</h1>
</div>
<cfscript>
	function showlist(){
				var qryStr = "
		            SELECT *
					FROM Survey
					
					";
		        q = New Query();
		        q.setDatasource(application.dataDSN);
		        q.setSQL(qryStr);
		        
		        surveys = q.execute().getResult();
				
					WriteOutput('<div class="list-group">');
				
				  for (row = 1 ; row LTE surveys.RecordCount ; row = (row + 1)){
				   		 WriteOutput('<a class="list-group-item" href="' & application.pageroot & 'surveys/takesurvey.cfm?surveyname=' & surveys[ "Name" ][ row ] & '">
				      	' & surveys[ "Name" ][ row ] & '
				    	</a>
				    	');				    
					}
					
					WriteOutput('</div>');
			}
				
</cfscript>
<!--- <cfoutput>#showlist()#</cfoutput> --->

<div class="table-responsive">
  <table class="table table-bordered">
    <tr>
    	<td><strong>Survey</strong></td>
		<td><strong>Description</strong></td>
		<td colspan="4"><strong>Tools</strong></td>
	</tr>
	<tr>
    	<td>Sample Survey 1</td>
		<td>A Sample survey about basic personal information</td>
	  	<td class="active tablebutton"><a href=surveys/takesurvey.cfm?surveyname=Sample%20Survey>Take</a></td>
	  	<td class="success tablebutton">Results</td>
	  	<td class="warning tablebutton">Edit</td>
	  	<td class="danger tablebutton">Delete</td>
	</tr>
	<tr>
    	<td>Sample Survey 2</td>
		<td>A Sample survey for programmatic testing</td>
	  	<td class="active tablebutton">Take</td>
	  	<td class="success tablebutton">Results</td>
	  	<td class="warning tablebutton">Edit</td>
	  	<td class="danger tablebutton">Delete</td>
	</tr>
	<tr>
    	<td>Sample Survey 3</td>
		<td>A Second sample survey for programmatic testing</td>
	  	<td class="active tablebutton">Take</td>
	  	<td class="success tablebutton">Results</td>
	  	<td class="warning tablebutton">Edit</td>
	  	<td class="danger tablebutton">Delete</td>
	</tr>
  </table>
</div>
<cfif not url.isAJAX>
	<rde:header mode="end" page="admin" >
</cfif>

