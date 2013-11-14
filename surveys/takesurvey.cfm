<cfimport prefix="rde" taglib="../tags/">

<cfparam name="url.isAJAX" default="false">
<cfif isDefined("URL.surveyid")>
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

<cfscript>
	function selectsurvey(surveyname){
	var qryStr = "
            SELECT Survey.Name, Question.Question, Question.id, Type.Type
			FROM Survey
			
			LEFT JOIN Question ON Survey.id = Question.Survey_id
			LEFT JOIN Type ON Question.Type_id = Type.id
			WHERE Survey.Name = ( :surveyname )
			";
	        q = New Query();
	        q.setDatasource(application.dataDSN);
	        q.setSQL(qryStr);
	        q.addParam(name="surveyname", value=surveyname, cfsqltype="cf_sql_varchar");
	        qSurvey = q.execute().getResult();
	 }
	 
</cfscript>

<cfscript>
	function showrow(query) {
		WriteOutput('<div class="page-header"><h1>Survey: ' & query[ "name" ][1] & "</h1></div>");
		WriteOutput('<div class="jumbotron"><form class="form-horizontal questions" ><fieldset>');
		
		
		for (intRow = 1 ; intRow LTE query.RecordCount ; intRow = (intRow + 1)){
 
		
			//WriteOutput("debug: " & query[ "id" ][ intRow ]);
			if(query[ "type" ][ intRow ] == "textbox"){
				WriteOutput('
				<div class="form-group">
  				<label class="form-label" for="textinput"> ' & query[ "question" ][ intRow ] & '</label>
  				<div class="forms">
   				 <input id="textinput" name="textinput" type="text" placeholder="Answer here" class="input-xlarge">
 				</div>
				</div>
				');
			}
			if(query[ "type" ][ intRow ] == "radio"){
				var qryStr = "
		            SELECT Option_text
					FROM Options
					WHERE Options.Question_id = ( :id )
					";
		        q = New Query();
		        q.setDatasource(application.dataDSN);
		        q.setSQL(qryStr);
		        q.addParam(name="id", value=query[ "id" ][ intRow ], cfsqltype="cf_sql_integer");
		        options = q.execute().getResult();
				WriteOutput('
				<div class="form-group">
				  <label class="form-label" for="radios">' & query[ "question" ][ intRow ] & '</label>
				  <div class="forms">');
				  for (intoptionRow = 1 ; intoptionRow LTE options.RecordCount ; intoptionRow = (intoptionRow + 1)){
				    WriteOutput('<label class="radio" for="radios-' & (intoptionRow - 1) & '">
				      <input type="radio" name="radios" id="radios-' & (intoptionRow - 1) & '" value="' & options[ "Option_text" ][ intoptionRow ] & '">
				      ' & options[ "Option_text" ][ intoptionRow ] & '
				    </label>');
				    
					}
				WriteOutput(' </div>
				</div>
				');
				
			}
			if(query[ "type" ][ intRow ] == "checkbox"){
				var qryStr = "
		            SELECT Option_text
					FROM Options
					WHERE Options.Question_id = ( :id )
					";
		        q = New Query();
		        q.setDatasource(application.dataDSN);
		        q.setSQL(qryStr);
		        q.addParam(name="id", value=query[ "id" ][ intRow ], cfsqltype="cf_sql_integer");
		        options = q.execute().getResult();
				WriteOutput('
				<div class="form-group">
				  <label class="form-label" for="checkboxes">' & query[ "question" ][ intRow ] & '</label>
				  <div class="forms">');
				  for (intoptionRow = 1 ; intoptionRow LTE options.RecordCount ; intoptionRow = (intoptionRow + 1)){
				    WriteOutput('<label class="checkbox" for="checkboxes-' & (intoptionRow - 1) & '">
				      <input type="checkbox" name="checkboxes" id="checkboxes-' & (intoptionRow - 1) & '" value="' & options[ "Option_text" ][ intoptionRow ] & '">
				      ' & options[ "Option_text" ][ intoptionRow ] & '
				    </label>');
				    
					}
				WriteOutput(' </div>
				</div>
				');
				
			}
			if(query[ "type" ][ intRow ] == "dropdown"){
				var qryStr = "
		            SELECT Option_text
					FROM Options
					WHERE Options.Question_id = ( :id )
					";
		        q = New Query();
		        q.setDatasource(application.dataDSN);
		        q.setSQL(qryStr);
		        q.addParam(name="id", value=query[ "id" ][ intRow ], cfsqltype="cf_sql_integer");
		        options = q.execute().getResult();
				WriteOutput('
				<div class="form-group">
				  <label class="form-label" for="selectbasic">' & query[ "question" ][ intRow ] & '</label>
				  <div class="forms">
				    <select id="selectbasic" name="selectbasic" class="input-xlarge">');
				  for (intoptionRow = 1 ; intoptionRow LTE options.RecordCount ; intoptionRow = (intoptionRow + 1)){
				    WriteOutput('<option>' & options[ "Option_text" ][ intoptionRow ] & '</option>');
				   }
				WriteOutput(' 
					</select>
				  </div>
				</div>
				');
				
			}
			
			
			
			
		}
	}

	
</cfscript>
<cfoutput>#selectsurvey(URL.surveyid)#</cfoutput>



<cfoutput>
	#showrow(qSurvey)#
</cfoutput>
</fieldset>
</form>

<button id="prev" role="button" class="btn btn-primary btn-lg">Prev</button>
<button id="next" role="button" class="btn btn-primary btn-lg">Next</button>
<button id="submit" role="button" class="btn btn-primary btn-lg">Submit</button>
</div>
<hr class="boldhr">
<script src="takesurvey.js" defer="true"></script>
<cfif not url.isAJAX>
	<rde:header mode="end" page="takesurvey" import="../">
</cfif>
