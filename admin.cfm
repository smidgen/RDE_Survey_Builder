<cfimport prefix="rde" taglib="tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="admin" >
</cfif>
<style>
	.tablebutton{
		width: 80px;
	}
	a:link {color:#000;text-decoration:none;}
	a:visited {color:#000;text-decoration:none;}
	a:hover {color:#000;text-decoration:none;}
	a:active {color:#000;text-decoration:none;}
</style>
<rde:security>
<div class="page-header">
  <h1>Surveys</h1>
</div>

<cffunction name="showlist">

	<cfquery name="surveys" datasource="#application.dataDSN#">
		SELECT *
		FROM Survey
	</cfquery>
	<cfscript>
				 	for (row = 1 ; row LTE surveys.RecordCount ; row = (row + 1)){
				 		WriteOutput('<tr>');
				  		WriteOutput('<td>' & surveys[ "Name" ][ row ] & '</td>');
				  		WriteOutput('<td>' & 'no description' & '</td>');
				   		WriteOutput('<td class="active tablebutton"><a href="' & application.pageroot & 'surveys/takesurvey.cfm?surveykey=' & surveys[ "surveyKey" ][ row ] & '">Take</a></td>');
				   		WriteOutput('<td class="success tablebutton"><a href="' & application.pageroot & 'surveys/viewresults.cfm?surveykey=' & surveys[ "surveyKey" ][ row ] & '">Results</a></td>');
				   		//WriteOutput('<td class="warning tablebutton"><a href="' & application.pageroot & 'builder/editsurvey.cfm?surveyid=' & surveys[ "Name" ][ row ] & '">Edit</a></td>');
				   		WriteOutput('<td class="danger tablebutton"><a href="' & application.pageroot & 'surveys/deletesurvey.cfm?surveyid=' & surveys[ "id" ][ row ] & '">Delete</a></td>');		    
						WriteOutput('</tr>');
					}
	</cfscript>
</cffunction>


<div class="table-responsive">
  <table class="table table-bordered">
    <tr>
    	<td><strong>Survey</strong></td>
		<td><strong>Description</strong></td>
		<td colspan="3"><strong>Tools</strong></td>
	</tr>
	<cfoutput>#showlist()#</cfoutput>
  </table>
</div>
<cfif not url.isAJAX>
	<rde:header mode="end" page="admin" >
</cfif>

