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

<form method="post" action="submitSurvey.cfm" id="surveyForm">
	<div>
		Apples? <input type="text" id="apples" name="apples" value="" /><br />
		Twinkies? <input type="text" id="twinkies" name="twinkies" value="" /><br />
		<input type="submit" name="Submit Survey" />
	</div>
</form>

<a href="#" onclick="alert(localStorage.apples); return false">Apples</a>
<a href="#" onclick="alert(localStorage.twinkies); return false">Twinkies</a>

<script type="text/javascript">
	$.rdeSurveyBuilder = {};
	$.rdeSurveyBuilder.SurveyFields = ['apples', 'twinkies'];

	$(function() {
		// Save to Local Storage
		$("#surveyForm input[type='text']").change(function() {
			localStorage[$(this).attr("name")] = $(this).val();
		});

		// Retrieve from Local Storage
		for (var i = 0; i < $.rdeSurveyBuilder.SurveyFields.length; i++) {
			var thisField = $.rdeSurveyBuilder.SurveyFields[i];

			if (typeof(localStorage[thisField]) !== 'undefined') {
				$("#" + thisField).val(localStorage[thisField]);
			}
		}
	});
</script>

<cfif not url.isAJAX>
	<rde:header mode="end">
</cfif>
