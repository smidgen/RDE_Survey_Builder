
<cfquery name="qVerify" datasource="#application.dataDSN#">
	    SELECT  id, Username, password
     	FROM    Users
	    WHERE Username = '#FORM.user_name#'
	    AND  password = '#FORM.user_pass#'
	</cfquery>
	 
	<cfif qVerify.RecordCount>
	    <cfset session.isLoggedIn = true>
		<cfset session.user = {}>
		<cfset session.user.id = qVerify.id[1]>
		<cfset session.user.name = qVerify.Username[1]>
		
		<script>
		self.location="admin.cfm";
		</script>
	< cfelse>
	    
	    <script>
	        alert("Your credentials could not be verified, please try again!");
	        self.location="admin/";
	    </script>
	   
	</cfif>

