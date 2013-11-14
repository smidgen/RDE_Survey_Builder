<cfcomponent displayname="CapstoneNJITFall2013" output="false">
	<cfset this.Name = "RDESurveyBuilder">
	<cfset this.SessionManagement = true>
	<cfset this.applicationtimeout="#createTimeSpan(0,0,0,1)#">
	
	<cfset this.clientmanagement = true>

	
	<cffunction name="OnApplicationStart" output="false">
		
		<cfset application.pageroot = "http://localhost:8500/projects/RDE/">
		<cfset application.dataDSN = "MSSQL">
		<cfsetting showdebugoutput="false" />
	</cffunction>
	


</cfcomponent>

