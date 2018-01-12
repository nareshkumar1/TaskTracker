<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Home</title>
<script>
$(document).ready(function(){
	$("#logout").click(function(){
		logout();
	});
});

var logout = function(){
	window.location.href ='${createLink(controller:"tastTracker",action:"logout")}'
}

var resetPassword = function(){
	$.post('${createLink(controller:"tastTracker",action:"changePassword")}',{},function(data){
			$("#passwordReset").html(data);
		});
}

var doResetPassword = function(){
	$.post('${createLink(controller:"tastTracker",action:"doChangePassword")}',{"password":$("#password1").val()},function(data){
			if(data=='success'){
				openDialog("password has been changed please login")
				logout();
				}
		});
}

</script>
</head>
<body>
  <div id='passwordReset'>
  
  </div>
</body>
</html>