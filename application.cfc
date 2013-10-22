<cfcomponent displayname="CapstoneNJITFall2013" output="false">
	<cfset this.Name = "RDESurveyBuilder">
	<cfset this.SessionManagement = true>
	<cfset this.applicationtimeout="#createTimeSpan(0,0,0,1)#">
	
	<cffunction name="OnApplicationStart" output="false">
		<cfset application.bananas = "yum">
		<cfset application.dataDSN = "database_dbsource">
		<cfsetting showdebugoutput="false" />
	</cffunction>
</cfcomponent>