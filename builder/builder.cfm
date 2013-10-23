<cfimport prefix="rde" taglib="../tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="builder" import="../">
</cfif>

<rde:security restricted="true">
	
<p>Dummy Builder Page</p>


<cfif not url.isAJAX>
	<rde:header mode="end" page="builder" import="../">
</cfif>