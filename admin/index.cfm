<cfimport prefix="rde" taglib="../tags/">

<cfparam name="url.isAJAX" default="false">

<cfif isdefined("session.isLoggedIn") and session.isLoggedIn>
	<cflocation url="../admin.cfm">
</cfif>

<cfif not url.isAJAX>
	<rde:header mode="start" page="index" import="../">
</cfif>
<style>
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

<div class="text-center logo">
<img  src="../assets/img/header.jpg">
</div>
<div class="indexpage col-md-offset-3 col-md-6">
	<div class="text-center loginhead">
		<h3>Login</h3>
	</div>
<form class="form-horizontal " role="form" action="../login_process.cfm" method="POST">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-4 control-label">Username</label>
    <div class="col-sm-6">
      <input type="text" class="form-control" id="inputEmail3" name="user_name" placeholder="username">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-4 control-label">Password</label>
    <div class="col-sm-6">
      <input type="password" class="form-control" id="inputPassword3" name="user_pass" placeholder="Password">
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-offset-6">
      <button type="submit" class="btn btn-default">Login</button>
    </div>
  </div>
</form>
</div>


<cfif not url.isAJAX>
	<rde:header mode="end" page="index" import="../">
</cfif>
