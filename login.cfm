<cfimport prefix="rde" taglib="tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="login">
</cfif>

<form action="login_process.cfm" method="post">

      Username: <input type="text" name="user_name" value=""><BR />

      Password: <input type="password" name="user_pass" value=""><BR />

      <input type="submit" name="login_user" value="Log In"><BR />

</form>




<cfoutput>Status:</cfoutput>
<rde:security>

<cfif not url.isAJAX>
	<rde:header mode="end" page="login">
</cfif>
