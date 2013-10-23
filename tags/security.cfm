<cfif isdefined("session.isLoggedIn") and session.isLoggedIn>
	<cfoutput>
		<p>
			ID: #session.user.id#<br />
			Name: #session.user.name#
		</p>
	</cfoutput>
<cfelse>
	<cfoutput>
		<p>
			not logged in
		</p>
	</cfoutput>
</cfif>