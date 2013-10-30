<cfparam name="attributes.restricted" default="false">

<cfif #attributes.restricted# EQ "true">
	<cfif isdefined("session.isLoggedIn") and session.isLoggedIn>
		<cfoutput>
			<p>
				ID: #session.user.id#<br />
				Name: #session.user.name#
			</p>
		</cfoutput>
	<cfelse>
		
		<h3 style="color: red;">Not logged in</h3>
		<a href="<cfoutput>#application.pageroot#</cfoutput>">back</a>
		
							<footer class="navbar navbar-inner navbar-fixed-bottom col-md-12" >
    	<p class="muted credit"><center>&copy; RDE Systems</center></p>
	</footer>
 </div>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
</body>
</html>

		
		<cfabort>
			
	</cfif>
</cfif>

