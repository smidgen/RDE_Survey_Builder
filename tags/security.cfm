<cfparam name="attributes.restricted" default="true">
<cfparam name="attributes.import" default="./">

<cfif #attributes.restricted# EQ "true">
	<cfif isdefined("session.isLoggedIn") and session.isLoggedIn>
	
	<cfelse>
		
		<h3 style="color: red;">Not logged in</h3>
		<a href="<cfoutput>#application.pageroot#</cfoutput>">back</a>
		
							<footer class="navbar navbar-inner navbar-fixed-bottom col-md-12" >
    	<p class="muted credit"><center><img style="height: 50px;" src="<cfoutput>#attributes.import#</cfoutput>assets/img/footer.png" ></center></p>
	</footer>
 </div>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
</body>
</html>

		
		<cfabort>
			
	</cfif>
</cfif>

