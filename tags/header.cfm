<cfparam name="attributes.mode" default="#thisTag.ExecutionMode#">
<cfparam name="attributes.import" default="./">
<cfif attributes.mode eq "start">
	<cfparam name="attributes.page">
	
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Up and Running with Bootstrap</title>
<link href="<cfoutput>#attributes.import#</cfoutput>assets/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="<cfoutput>#attributes.import#</cfoutput>assets/css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
<!-- HTML5 shim for IE backwards compatibility -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>

<body >
	
	<div class="container" >
	<header class="row" >
    	<h1 class="col-md-12"><center><img src="<cfoutput>#attributes.import#</cfoutput>assets/img/logo.jpg" />&nbsp;RDE Systems Survey Builder</center></h1>
    </header>
	
	
	<nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">Home</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
      <li <cfif attributes.page eq "index">class="active"</cfif>><a href="<cfoutput>#attributes.import#</cfoutput>index.cfm">Welcome Page</a></li>
      <li <cfif attributes.page eq "takesurvey">class="active"</cfif>><a href="<cfoutput>#attributes.import#</cfoutput>surveys/takesurvey.cfm">Take a Survey</a></li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Survey Builder <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="#">Build New Survey</a></li>
          <li><a href="#">Edit Survey</a></li>
        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">User <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li <cfif attributes.page eq "login">class="active"</cfif>><a href="<cfoutput>#attributes.import#</cfoutput>login.cfm">Login</a></li>
          <li <cfif attributes.page eq "logout">class="active"</cfif>><a href="<cfoutput>#attributes.import#</cfoutput>logout.cfm">Logout</a></li>

        </ul>
      </li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>

<cfelse>
	<footer class="navbar navbar-inner navbar-fixed-bottom col-md-12" style="background-color: #c0c0c0;">
    	<p class="muted credit"><center>&copy; RDE Systems</center></p>
	</footer>
 </div>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<cfoutput>#attributes.import#</cfoutput>assets/js/bootstrap.min.js"></script>
</body>
</html>
</cfif>