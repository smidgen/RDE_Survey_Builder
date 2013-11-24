	
	<cfset curr = dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(), "HH:mm:ss.SSS")>
	


    <cfloop collection=#form# item="entry">
		<cfif not #entry# eq 'FIELDNAMES'>
		<cfif #entry# eq 'SURVEYKEY'>

			
			<cfoutput>#storesurvey(form[entry], CGI.REMOTE_ADDR, curr)#</cfoutput>
		</cfif>
		</cfif>
    </cfloop>
    
    <cfset currentid = getstoresurveyid(curr)["id"]>
	
    <cfloop collection=#form# item="entry">
		<cfif not #entry# eq 'FIELDNAMES'>
		<cfif not #entry# eq 'SURVEYKEY'>
			<cfoutput>#currentid#, #entry#, #form[entry]#</cfoutput>
			<cfoutput>#storequestion(currentid, entry, form[entry])#</cfoutput>
			
		</cfif>
		</cfif>
    </cfloop>
	



<cfscript>
    function storesurvey(surveykey, ipaddress, date){
	var qryStr = '
            INSERT INTO Survey_Taken (Date, Ip_address, surveyKey)
            VALUES (:date, :ipaddress, :surveykey);
			';
	        q = New Query();
	        q.setDatasource(application.dataDSN);
	        q.setSQL(qryStr);
	        q.addParam(name="surveykey", value=surveykey, cfsqltype="cf_sql_varchar");
	        q.addParam(name="ipaddress", value=ipaddress, cfsqltype="cf_sql_varchar");
	        q.addParam(name="date", value=date, cfsqltype="cf_sql_varchar");
	        q.execute();
	 }
	function getstoresurveyid(date){
	var qryStr = '
            SELECT id FROM Survey_Taken
			WHERE Date = ( :date );
			';
	        q = New Query();
	        q.setDatasource(application.dataDSN);
	        q.setSQL(qryStr);
	        q.addParam(name="date", value=date, cfsqltype="cf_sql_varchar");
	        qID = q.execute().getResult();
	        return(qID);
	 }
	
	
    function storequestion(surveytakenid, questionid, response){
	var qryStr = '
            INSERT INTO Response (User_response, Survey_Taken_id, Question_id)
            VALUES (:response, :surveytakenid, :questionid);
			';
	        q = New Query();
	        q.setDatasource(application.dataDSN);
	        q.setSQL(qryStr);
	        q.addParam(name="surveytakenid", value=surveytakenid, cfsqltype="cf_sql_varchar");
	        q.addParam(name="questionid", value=questionid, cfsqltype="cf_sql_varchar");
	        q.addParam(name="response", value=response, cfsqltype="cf_sql_varchar");
	        q.execute();
	 }
</cfscript>

<cflocation url="../surveys/selectsurvey.cfm">
