<cfimport prefix="rde" taglib="tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="index">
</cfif>

<p>Hello world!</p>

<p>Bananas: <cfoutput>#application.bananas#</cfoutput></p>

<rde:security>

<cfif not url.isAJAX>
	<rde:header mode="end">
</cfif>
