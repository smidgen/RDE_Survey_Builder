<cfparam name="attributes.mode" default="#thisTag.ExecutionMode#">
<cfparam name="attributes.import" default="./">
<cfif attributes.mode eq "start">
	<cfparam name="attributes.page">
	
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Survey Builder</title>

<link href="<cfoutput>#attributes.import#</cfoutput>assets/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="<cfoutput>#attributes.import#</cfoutput>assets/css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
<style>
	html, body {
   		 height: 100%;
	}
	body {
		background-color: #C0C0C0;
		padding-top: 40px;
	}
	.container {
		
		padding: 10px;
		padding-top: 20px;
		box-shadow: 0 0 30px black;
		background-color: #FFFFFF;
		height: 100%;
	}
	.pagefooter {
		
		font-color: black;
	}
	.topnavbar {
		background-color: #126aa9;
		
	}
	.navbar .nav  > li > a  {

    color:  #eee;
	}

</style>
<!-- HTML5 shim for IE backwards compatibility -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>

<body >

  <nav class=" topnavbar navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
	<img  style="height: 50px;" src="<cfoutput>#attributes.import#</cfoutput>assets/img/header.jpg" >
    
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <cfif isdefined("session.isLoggedIn") and session.isLoggedIn>
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
      <li <cfif attributes.page eq "index">class="active"</cfif>><a href="<cfoutput>#attributes.import#</cfoutput>index.cfm">Home Page</a></li>

	  <li <cfif attributes.page eq "builder">class="active"</cfif>><a href="<cfoutput>#attributes.import#</cfoutput>builder/surveyMake.cfm">Survey Builder</a></li>
	  <li <cfif attributes.page eq "admin">class="active"</cfif>><a href="<cfoutput>#attributes.import#</cfoutput>admin.cfm">Survey Admin</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    	
    	
    	
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><cfif isdefined("session.isLoggedIn") and session.isLoggedIn><cfoutput>#session.user.name#</cfoutput><cfelse>User</cfif> <b class="caret"></b></a>
        <ul class="dropdown-menu">
          
          <li <cfif attributes.page eq "logout">class="active"</cfif>><a href="<cfoutput>#attributes.import#</cfoutput>logout.cfm">Logout</a></li>

        </ul>
      </li>
    </ul>
  </div><!-- /.navbar-collapse -->
  </cfif>
</nav>
	
<div class="container fill">

<cfelse>
	</div>
	<footer class="pagefooter navbar navbar-inner navbar-fixed-bottom col-md-12">
    	<p class="muted credit"><center><img style="height: 50px;" src="<cfoutput>#attributes.import#</cfoutput>assets/img/footer.png" ></center></p>
	</footer>


<script src="//code.jquery.com/jquery-latest.js"></script>
<script src="<cfoutput>#attributes.import#</cfoutput>assets/js/bootstrap.min.js"></script>
</body>
</html>
</cfif>
