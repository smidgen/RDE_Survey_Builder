<cfimport prefix="rde" taglib="tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="logout">
</cfif>

<cfset session.isLoggedIn = false>
<cfset structClear(session.user)>

<cfoutput>Status:</cfoutput>
<rde:security>

<cfif not url.isAJAX>
	<rde:header mode="end" page="logout">
</cfif>