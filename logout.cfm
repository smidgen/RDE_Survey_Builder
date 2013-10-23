<cfimport prefix="rde" taglib="tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="logout">
</cfif>

<cfset session.isLoggedIn = false>
<cfset structClear(session.user)>
<script>
self.location="index.cfm";
</script>

<cfif not url.isAJAX>
	<rde:header mode="end" page="logout">
</cfif>