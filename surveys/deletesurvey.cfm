<cfimport prefix="rde" taglib="../tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="deletesurvey" import="../" >
</cfif>

<rde:security>
	
	<cfscript>
	function deletesurvey(surveyid){
	var qryStr = '
            DELETE FROM Survey
            WHERE Name = ( :surveyid );
			';
	        q = New Query();
	        q.setDatasource(application.dataDSN);
	        q.setSQL(qryStr);
	        q.addParam(name="surveyid", value=surveyid, cfsqltype="cf_sql_varchar");
	        q.execute();
	 }
	 
	</cfscript>
	<cfoutput>#deletesurvey(URL.surveyid)#</cfoutput>
	<cflocation url="../admin.cfm">
	
<cfif not url.isAJAX>
	<rde:header mode="end" page="deletesurvey" import="../" >
</cfif>