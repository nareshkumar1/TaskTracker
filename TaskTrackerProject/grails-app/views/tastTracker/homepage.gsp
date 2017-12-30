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
	$.post('${createLink(controller:"tastTracker",action:"logout")}',{},function(data){
	});
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
  <div id='passwordReset' style='margin-left:500px;margin-top:100px'>
  
  </div>
</body>
</html>