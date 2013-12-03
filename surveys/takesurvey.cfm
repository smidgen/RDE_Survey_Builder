<cfimport prefix="rde" taglib="../tags/">

<cfparam name="url.isAJAX" default="false">
<cfif isDefined("URL.surveykey")>
<cfelse>
<cflocation url="selectsurvey.cfm">
</cfif>
<cfif not url.isAJAX>
	<rde:header mode="start" page="takesurvey" import="../">
</cfif>
<style>
.questions {
    position: relative;
    width: 500px;
    height: 300px;
}
	.form-group {
    position: absolute;
    display: none;
}
	.form-group:first-child {
    display: block;
}
input[type=checkbox] { height: 34px }
input[type=radio] { height: 34px }
.page-header {
  padding-bottom: 9px;
  margin: 40px 0 20px;
  border-bottom: 2px solid #000;
}
.boldhr {
	height: 2px;
	background-color: black;
}
</style>


<cffunction name="selectsurvey">
	<cfargument name="surveykey">
	<cfquery name="qSurvey" datasource="#application.dataDSN#">
		SELECT Survey.Name, Survey.Description, Survey.surveyKey, Question.Question, Question.id, Type.Type
		FROM Survey
		LEFT JOIN Question ON Survey.id = Question.Survey_id
		LEFT JOIN Type ON Question.Type_id = Type.id
		WHERE Survey.surveyKey = <cfqueryparam value="#arguments.surveykey#" cfsqltype="cf_sql_varchar">
	</cfquery>
	<cfreturn qSurvey>
</cffunction>


<cffunction name="showrow">
	<cfargument name="query">
	<cfscript>
		WriteOutput('<div class="page-header"><h1>Survey: ' & query[ "name" ][1] & "</h1></div>");
		WriteOutput('<div class="jumbotron"><form class="form-horizontal questions" action="submitSurvey.cfm?surveykey=' & query[ "surveyKey" ][1] & '" method="POST"><fieldset>

		');
	</cfscript>

	<cfloop from="1" to="#query.RecordCount#" index="intRow">
		<cfscript>
			//WriteOutput("debug: " & query[ "id" ][ intRow ]);
			if(query[ "type" ][ intRow ] == "textbox"){
				WriteOutput('
				<div class="form-group">
  				<label class="form-label" for="' & query[ "id" ][ intRow ] & '"> ' & query[ "question" ][ intRow ] & '</label>
  				<div class="forms">
   				 <input id="' & query[ "id" ][ intRow ] & '" name="' & query[ "id" ][ intRow ] & '" type="text" placeholder="Answer here" class="input-xlarge">
 				</div>
				</div>
				');
			}
		</cfscript>
		<cfif query[ "type" ][ intRow ] eq "radio">
			<cfquery name="options" datasource="#application.dataDSN#">
				SELECT Option_text
				FROM Options
				WHERE Options.Question_id = <cfqueryparam value="#query.id[intRow]#" cfsqltype="cf_sql_integer">
			</cfquery>

			<cfscript>
				WriteOutput('
				<div class="form-group">
				  <label class="form-label" for="radios">' & query[ "question" ][ intRow ] & '</label>
				  <div class="forms">');
				  for (intoptionRow = 1 ; intoptionRow LTE options.RecordCount ; intoptionRow = (intoptionRow + 1)){
				    WriteOutput('<label class="radio" for="' & query[ "id" ][ intRow ] & '-' & (intoptionRow - 1) & '">
				      <input type="radio" name="' & query[ "id" ][ intRow ] & '" id="' & query[ "id" ][ intRow ] & '-' & (intoptionRow - 1) & '" value="' & options[ "Option_text" ][ intoptionRow ] & '">
				      ' & options[ "Option_text" ][ intoptionRow ] & '
				    </label>');

					}
				WriteOutput(' </div>
				</div>
				');
			</cfscript>
		</cfif>

		<cfif query[ "type" ][ intRow ] eq "checkbox">
			<cfquery name="options" datasource="#application.dataDSN#">
				SELECT Option_text
				FROM Options
				WHERE Options.Question_id = <cfqueryparam value="#query.id[intRow]#" cfsqltype="cf_sql_integer">
			</cfquery>
			<cfscript>
				WriteOutput('
				<div class="form-group">
				  <label class="form-label" for="checkboxes">' & query[ "question" ][ intRow ] & '</label>
				  <div class="forms">');
				  for (intoptionRow = 1 ; intoptionRow LTE options.RecordCount ; intoptionRow = (intoptionRow + 1)){
				    WriteOutput('<label class="checkbox" for="' & query[ "id" ][ intRow ] & '-' & (intoptionRow - 1) & '">
				      <input type="checkbox" name="' & query[ "id" ][ intRow ] & '" id="' & query[ "id" ][ intRow ] & '-' & (intoptionRow - 1) & '" value="' & options[ "Option_text" ][ intoptionRow ] & '">
				      ' & options[ "Option_text" ][ intoptionRow ] & '
				    </label>');

					}
				WriteOutput(' </div>
				</div>
				');
			</cfscript>
		</cfif>
		<cfif query[ "type" ][ intRow ] eq "dropdown">
			<cfquery name="options" datasource="#application.dataDSN#">
		            SELECT Option_text
					FROM Options
					WHERE Options.Question_id = <cfqueryparam value="#query.id[intRow]#" cfsqltype="cf_sql_integer">
			</cfquery>
			<cfscript>
				WriteOutput('
				<div class="form-group">
				  <label class="form-label" for="' & query[ "id" ][ intRow ] & '">' & query[ "question" ][ intRow ] & '</label>
				  <div class="forms">
				    <select id="' & query[ "id" ][ intRow ] & '" name="' & query[ "id" ][ intRow ] & '" class="input-xlarge">');
				  for (intoptionRow = 1 ; intoptionRow LTE options.RecordCount ; intoptionRow = (intoptionRow + 1)){
				    WriteOutput('<option>' & options[ "Option_text" ][ intoptionRow ] & '</option>');
				   }
				WriteOutput('
					</select>
				  </div>
				</div>
				');
			</cfscript>
		</cfif>

	</cfloop>

</cffunction>


<cfset qSurvey = selectsurvey(URL.surveykey)>

<div>
<cfoutput>
	#showrow(qSurvey)#
</cfoutput>

</div>

<button type="button" id="prev" role="button" class="btn btn-primary btn-lg">Prev</button>
<button type="button" id="next" role="button" class="btn btn-primary btn-lg">Next</button>
<button type="submit" id="submit" role="button" class="btn btn-primary btn-lg">Submit</button>

</fieldset>
</form>

</div>
<hr class="boldhr">
<script src="takesurvey.js" defer="true"></script>
<cfif not url.isAJAX>
	<rde:header mode="end" page="takesurvey" import="../">
</cfif>
