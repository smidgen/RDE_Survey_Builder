
	<cfset curr = dateFormat(Now(),"yyyy-mm-dd") & " " & timeFormat(now(), "HH:mm:ss.SSS")>





			<cfoutput>#storesurvey(URL.surveykey, CGI.REMOTE_ADDR, curr)#</cfoutput>


    <cfset currentid = getstoresurveyid(curr)>
	<cfset currentid = currentid["id"]>

    <cfloop collection=#form# item="entry">
		<cfif not #entry# eq 'FIELDNAMES'>
			<cfoutput>#currentid#, #entry#, #form[entry]#</cfoutput>
			<cfoutput>#storequestion(currentid, entry, form[entry])#</cfoutput>

		</cfif>
    </cfloop>




<cffunction name="storesurvey">
	<cfargument name="surveykey">
	<cfargument name="ipaddress">
	<cfargument name="date">
	<cfquery datasource="#application.dataDSN#">
            INSERT INTO Survey_Taken (Date, Ip_address, surveyKey)
            VALUES (
				<cfqueryparam value="#date#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#ipaddress#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#surveykey#" cfsqltype="cf_sql_varchar">
			)
	</cfquery>
</cffunction>
<cffunction name="getstoresurveyid">
	<cfargument name="date">
	<cfquery datasource="#application.dataDSN#" name="qID">
            SELECT id FROM Survey_Taken
			WHERE Date = <cfqueryparam value="#date#" cfsqltype="cf_sql_varchar">
	</cfquery>
	<cfreturn qID>
</cffunction>


<cffunction name="storequestion">
	<cfargument name="surveytakenid">
	<cfargument name="questionid">
	<cfargument name="response">
	<cfquery datasource="#application.dataDSN#">
            INSERT INTO Response (User_response, Survey_Taken_id, Question_id)
            VALUES (
				<cfqueryparam value="#response#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#surveytakenid#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#questionid#" cfsqltype="cf_sql_varchar">
			)
	</cfquery>
</cffunction>

<cflocation url="../surveys/selectsurvey.cfm?complete=true">
