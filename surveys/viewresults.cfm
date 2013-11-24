<cfimport prefix="rde" taglib="../tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="viewresults" import="../" >
</cfif>

<rde:security import="../">
	
	<cfscript>
	function results(surveyid){
	var qryStr = '
            SELECT Survey_Taken.*, Response.Question_id, Response.Survey_Taken_id, Response.User_response, Question.Question FROM Survey_Taken
            LEFT JOIN Response
			ON Survey_Taken.id = Response.Survey_Taken_id
			LEFT JOIN Question
			ON Response.Question_id = Question.id
			WHERE Survey_Taken.surveyKey = ( :surveyid )
			';
	        q = New Query();
	        q.setDatasource(application.dataDSN);
	        q.setSQL(qryStr);
	        q.addParam(name="surveyid", value=surveyid, cfsqltype="cf_sql_varchar");
	        qResponses = q.execute().getResult();
	        
	        		for (row = 1 ; row LTE qResponses.RecordCount ; row = (row + 1)){
				 		WriteOutput('<tr>');
				  		WriteOutput('<td>' & qResponses[ "Ip_address" ][ row ] & '</td>');
				  		WriteOutput('<td>' & qResponses[ "Date" ][ row ] & '</td>');
				  		WriteOutput('<td>' & qResponses[ "Question" ][ row ] & '</td>');
				  		WriteOutput('<td>' & qResponses[ "User_response" ][ row ] & '</td>');
						WriteOutput('</tr>');
					}

	 }
	 
	 
	</cfscript>
	
<div class="table-responsive">
  <table class="table table-bordered">
    <tr>
    	<td><strong>IP</strong></td>
		<td><strong>Date</strong></td>
		<td><strong>Question</strong></td>
		<td><strong>Answer</strong></td>
	</tr>
	<cfoutput>#results(URL.surveykey)#</cfoutput>
  </table>
</div>
	
<cfif not url.isAJAX>
	<rde:header mode="end" page="viewresults" import="../" >
</cfif>