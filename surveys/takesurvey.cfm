<cfimport prefix="rde" taglib="../tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="takesurvey" import="../">
</cfif>

<!---
<cfquery name="qSurvey" datasource="#application.dataDSN#">
select *
from surveys
where id=<cfqueryparam value="#url.surveyid#">
</cfquery>
--->



<cfif not url.isAJAX>
	<rde:header mode="end" page="takesurvey" import="../">
</cfif>
