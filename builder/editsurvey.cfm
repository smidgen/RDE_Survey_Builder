<cfimport prefix="rde" taglib="../tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="editsurvey" import="../" >
</cfif>

<rde:security>
	
	
	
<cfif not url.isAJAX>
	<rde:header mode="end" page="editsurvey" import="../" >
</cfif>