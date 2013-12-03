<cfimport prefix="rde" taglib="../tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="viewresults" import="../" >
</cfif>

<rde:security import="../">

	<cffunction name="results">
		<cfargument name="surveyid">
		<cfquery name="qResponses" datasource="#application.dataDSN#">
            SELECT *
			FROM Survey_Taken
			WHERE Survey_Taken.surveyKey = <cfqueryparam value="#surveyid#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfscript>

	        		for (row = 1 ; row LTE qResponses.RecordCount ; row = (row + 1)){
				 		WriteOutput('<tr>');
				 		WriteOutput('<td><a href="viewuserresults.cfm?userid=' & qResponses[ "id" ][ row ] & '">' & qResponses[ "id" ][ row ] & '</a></td>');
				  		WriteOutput('<td>' & qResponses[ "Ip_address" ][ row ] & '</td>');
				  		WriteOutput('<td>' & qResponses[ "Date" ][ row ] & '</td>');
				  		WriteOutput('<td>' & qResponses[ "surveyKey" ][ row ] & '</td>');
						WriteOutput('</tr>');
					}

		</cfscript>
	</cffunction>

<div class="table-responsive">
  <table class="table table-bordered">
    <tr>
    	<td><strong>User ID</strong></td>
    	<td><strong>IP</strong></td>
		<td><strong>Date</strong></td>
		<td><strong>Key</strong></td>
	</tr>
	<cfoutput>#results(URL.surveykey)#</cfoutput>
  </table>
</div>

<cfif not url.isAJAX>
	<rde:header mode="end" page="viewresults" import="../" >
</cfif>
