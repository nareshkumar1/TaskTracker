<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title><g:layoutTitle default="Grails"/></title>
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery-3.2.1.js')}"></script>		
  		<link type='text/css' rel='Stylesheet' href="${resource(dir:'css',file:'basic.css')}"></link>
  		<link type='text/css' rel='Stylesheet' href="${resource(dir:'css',file:'sidebar.css')}"></link>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
		<!-- <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> -->
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery.dataTables.min.js')}"></script>
		<!-- <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script> -->
		<script type="text/javascript" src="${resource(dir:'js',file:'dataTables.bootstrap.min.js')}"></script>
		<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'  type='text/css'>
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">	
		
		<script>

		var openDialog = function(input){
				$("#inputData").text(input);
				$("#sucessDialog").modal();
			}

		$(function(){
				$("#myNavbar li").on("load",function(event){
					$("#myNavbar li").removeClass('active');
					$(this).addClass('active');
					})

			});
			
			</script>
		<g:layoutHead/>
	</head>
	<body  background='background/background_new2.jpg'>
  <div class="modal fade" id="sucessDialog" role="dialog">
    <div class="modal-dialog modal-sm" style="width:400px;margin-top:200px;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" >
        </div>
        <div class="modal-body">
          <p id='inputData'></p>
        </div>
        <div class="modal-footer">
          <button type="button" id="ok" class="okButton btn btn-info btn-sm" data-dismiss="modal">OK</button>
        </div>
      </div>
    </div>
  </div>
	<g:if test='${session.user}'>
	<nav class="navbar navbar-inverse" style="font-size:1.2em;width:100.0%;margin-left:0px">
  <div class="container-fluid" >
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand uppercase">${session?.organization.orgName}</a>
    </div>
    <div class="collapse navbar-collapse dropDownFont" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href='${createLink(controller:"tastTracker",action:"index")}' class='uppercase'>HOME</a></li>
        <li class="dropdown">
          <a href="#">TASK</a>
        </li>
        <li><a href="${createLink(controller:'leave',action:'index')}">LEAVE</a></li>
        <g:if test='${session.user.isAdmin}'>
           <li><a  href="${createLink(controller:"admin",action:"index")}" >SETUP</a>       
           </li>
        </g:if>
      </ul>
      <ul class="nav navbar-nav navbar-right dropDownFont">
        	<li class='dropdown' >
        	<a  class="dropdown-toggle uppercase" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span>&nbsp   ${session.user.userFullName}</a>
        	<ul class="dropdown-menu" style="font-size:1.0em">
        	<li><a href='#' onclick="editUser()">Update Profile</a></li>
            <li><a href='#' onclick="changePassword()">Change Password</a></li>
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
