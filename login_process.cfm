<!---	<cfquery name="qVerify" datasource="userLogin">
	    SELECT  user_id, user_name, user_pass
     	FROM    tblAdmins
	    WHERE user_name = '#user_name#'
	    AND  user_pass = '#user_pass#'
	</cfquery>
	 
	<cfif qVerify.RecordCount>
	    <cfset session.isLoggedIn = true>
		<cfset session.user = {}>
		<cfset session.user.id = 123>
		<cfset session.user.name = "Joe">
	< cfelse>
	    <!--- this user did not log in correctly, alert and redirect to the login page 
	    <script>
	        alert("Your credentials could not be verified, please try again!!!");
	        self.location="Javascript:history.go(-1)";
	    </script>
	    --->
	</cfif>
--->
<cfset session.isLoggedIn = true>
<cfset session.user = {}>
<cfset session.user.id = 123>
<cfset session.user.name = "Josh">
<script>
self.location="index.cfm";
</script>