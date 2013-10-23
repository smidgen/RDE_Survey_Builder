<cfimport prefix="rde" taglib="tags/">

<cfparam name="url.isAJAX" default="false">

<cfif not url.isAJAX>
	<rde:header mode="start" page="login">
</cfif>



<form class="form-inline" role="form" action="login_process.cfm" method="post">
  <div class="form-group">
    <label class="sr-only" for="user_name">Username</label>
    <input type="text" class="form-control" id="user_name" placeholder="Enter Username">
  </div>
  <div class="form-group">
    <label class="sr-only" for="user_pass">Password</label>
    <input type="password" class="form-control" id="user_pass" placeholder="Password">
  </div>
<input type="submit" class="btn btn-default" name="login_user" value="Log In">
  
</form>

<cfif not url.isAJAX>
	<rde:header mode="end" page="login">
</cfif>
