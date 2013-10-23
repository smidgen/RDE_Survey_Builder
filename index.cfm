<cfimport prefix="rde" taglib="tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="index">
</cfif>

<p>Hello world!</p>


<p>pageroot: <cfoutput>#application.pageroot#</cfoutput></p>


<cfif not url.isAJAX>
	<rde:header mode="end" page="index">
</cfif>
