<cfimport prefix="rde" taglib="../tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="takesurvey" import="../">
</cfif>
<style>
  .page-header {
  padding-bottom: 9px;
  margin: 40px 0 20px;
  border-bottom: 2px solid #000;
}
	.indexpage{
		
		background-color:#e3e4ea;
		border: 2px solid;
		border-color:#353535;
		box-shadow: 0 0 10px black;
	}
	.logo{
		padding: 20px;
		margin: 20px;

	}
	.loginhead{
		
		margin: 20px;

	}
</style>



<cfscript>
	function selectform(){
				var qryStr = "
		            SELECT *
					FROM Survey
					
					";
		        q = New Query();
		        q.setDatasource(application.dataDSN);
		        q.setSQL(qryStr);
		        
		        surveys = q.execute().getResult();
				
					WriteOutput('
					
							<div class="text-center logo">
							<img  src="../assets/img/header.jpg">
							</div>
							<div class="indexpage col-md-offset-3 col-md-6">
								<div class="text-center loginhead">
									<h3>Enter Survey Key</h3>
								</div>
							<form class="form-horizontal " role="form" action="takesurvey.cfm" method="GET">
							  <div class="form-group">
							    <label for="surveykey" class="col-sm-4 control-label">Survey Key</label>
							    <div class="col-sm-6">
							      <input type="text" class="form-control" id="surveykey" name="surveykey" placeholder="Survey Key">
							    </div>
							  </div>
							
							  <div class="form-group">
							    <div class="col-sm-offset-6">
							      <button type="submit" class="btn btn-default">Begin</button>
							    </div>
							  </div>
							</form>
							</div>
					
					');
				
				  
					
					WriteOutput('</div>');
			}
				
</cfscript>
<cfoutput>#selectform()#</cfoutput>



<cfif not url.isAJAX>
	<rde:header mode="end" page="takesurvey" import="../">
</cfif>
<cfif isDefined("URL.complete") and URL.complete eq "true">
	<script>alert('Successfully Taken Survey')</script>
</cfif>