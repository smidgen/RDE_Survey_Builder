<cfcomponent displayname="CapstoneNJITFall2013" output="false">
	<cfset this.Name = "RDESurveyBuilder">
	<cfset this.SessionManagement = true>
	<cfset this.applicationtimeout="#createTimeSpan(0,0,0,1)#">
	
	<cfset this.clientmanagement = true>

	
	<cffunction name="OnApplicationStart" output="false">
		
		<cfset application.pageroot = "https://e2dev.rde.org/Developers/Nolan/NJITCapstone2013F/">
		<cfset application.dataDSN = "CapstoneNJITFall2013_data">
	</cffunction>

	<cffunction name="OnRequestStart" output="false">
		<cfsetting showdebugoutput="false" />
	</cffunction>
</cfcomponent>
