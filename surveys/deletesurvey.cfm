<cfimport prefix="rde" taglib="../tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="deletesurvey" import="../" >
</cfif>

<rde:security>
	
	<cffunction name="deletesurvey">
		<cfargument name="surveyid">
		<cfquery datasource="#application.dataDSN#">
            DELETE FROM Survey
            WHERE id = <cfqueryparam value="#surveyid#" cfsqltype="cf_sql_varchar">
		</cfquery>
	</cffunction>
	<cfoutput>#deletesurvey(URL.surveyid)#</cfoutput>
	<cflocation url="../admin.cfm">
	
<cfif not url.isAJAX>
	<rde:header mode="end" page="deletesurvey" import="../" >
</cfif>
