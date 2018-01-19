<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery-3.2.1.js')}"></script>		
  		<link type='text/css' rel='Stylesheet' href="${resource(dir:'css',file:'basic.css')}"></link>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
		<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'  type='text/css'>
		<script>

		var openDialog = function(input){
				$("#inputData").text(input);
				$("#sucessDialog").modal();
			}
  </script>
		<g:layoutHead/>
	</head>
	<body  background='background/background_new2.jpg'>
  <div class="modal fade" id="sucessDialog" role="dialog">
    <div class="modal-dialog modal-sm" style="width:400px;margin-top:200px">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color:green">
        </div>
        <div class="modal-body">
          <p id='inputData'></p>
        </div>
        <div class="modal-footer">
          <button type="button" id="ok" class="btn btn-info btn-sm" data-dismiss="modal">OK</button>
        </div>
      </div>
    </div>
  </div>
	<g:if test='${session.user}'>
	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand uppercase appText">${session?.user.getOrganizationName()[0]}</a>
    </div>
    <div class="collapse navbar-collapse dropDownFont" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active "><a href='${createLink(controller:"tastTracker",action:"index")}' class='uppercase'>Home</a></li>
        <li class="dropdown">
          <a href="#">Page 1 </a>
          
        </li>
        <li><a href="#">Page 2</a></li>
        <g:if test='${session.user.isAdmin}'>
           <li><a class="dropdown-toggle" data-toggle="dropdown">Setup <span class="caret"></span></a>
           		<ul class="dropdown-menu">
            	<li><a href="#">Manage users</a></li>
            	<li><a href="#">Edit Organization</a></li>
            	<li><a href="#">Other settings</a></li>
          </ul>
           
           </li>
        </g:if>
      </ul>
      <ul class="nav navbar-nav navbar-right dropDownFont">
        	<li class='dropdown' >
        	<a  class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span> ${session.user.userFullName}</a>
        	<ul class="dropdown-menu">
        	<li><a href='${createLink(controller:"tastTracker",action:"editUser")}'>Update Profile</a></li>
            <li><a href='${createLink(controller:"tastTracker",action:"changePassword")}'>Change Password</a></li>
            <li><a href="#">Change Setting</a></li>
            <li class="divider"></li>
            <li><a class="dropDownFont" href='${createLink(controller:"tastTracker",action:"logout")}'><span class="glyphicon glyphicon-log-out"></span> Sign Out</a></li>
            
        	</ul>
        	</li>
      </ul>
    </div>
  </div>
</nav>
	</g:if>
	<g:layoutBody/>
	</body>
</html>
