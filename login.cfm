<cfimport prefix="rde" taglib="tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="login">
</cfif>

<cfset session.isLoggedIn = true>
<cfset session.user = {}>
<cfset session.user.id = 123>
<cfset session.user.name = "Joe">

<cfoutput>Status:</cfoutput>
<rde:security>

<cfif not url.isAJAX>
	<rde:header mode="end" page="login">
</cfif>
