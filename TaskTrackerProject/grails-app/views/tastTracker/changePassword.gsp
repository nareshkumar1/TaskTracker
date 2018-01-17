<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta name="layout" content="main"/>
<script>
$(document).ready(function(){
	$("#resetPass").click(function(){
		if(($("#password1").val()!=$("#password2").val())||($("#password1").val().length==0&&$("#password2").val().length==0){	
		openDialog("Password should be same in both field")	
	}else{
		doResetPassword();
	}
	});
	
});
var showPassword =function(){
	if($("#showPassword").prop('checked')==true){
		$("#password1").attr('type','text')
		$("#password2").attr('type','text')
		}
	else{
		$("#password1").attr('type','password')
		$("#password2").attr('type','password')
	}
}
var doResetPassword = function(){
	$.post('${createLink(controller:"tastTracker",action:"doChangePassword")}',{"password":$("#password1").val()},function(data){
			if(data=='success'){
				openDialog("Click Ok to change password")
				$("#ok").click(function(){
					logout()
				});
			}
		});
}

var logout = function(){
	window.location.href ='${createLink(controller:"tastTracker",action:"logout")}'
}

</script>
</head>
<body>
  <div  style='margin-left:35%;' >
  	<table style='margin-left:0;margin-top:50px'>
  	<tr>
  		<td>
  		<label id="user" class='appText' style="margin-left:40px;font-size:18px">${session.user.userName}</label>
  		</td>
  	</tr>
  	<tr  style='height:60px;'>
  		<td>
  		<input type="password"  class="form-control" id="password1" placeholder="New Password" style="width:260px"/>
  		</td>
  	</tr>
  	<tr>
  		<td>
  		<input type="password" class="form-control" id="password2" placeholder="Confirm Password" style="width:260px"/>
  		</td>
  	</tr>
  	<tr>
  		<td>
  		<div class='checkbox'>
  			<label><input id="showPassword" class='appFont' type="checkbox" onchange='showPassword()'>Show password</label>
  		</div>
  		</td>
  	</tr>
  	<tr>
  		<td>
  		<input type="button" class="shadowBox btn btn-info btn-sm" id="resetPass"  value="Reset" style="width:260px"/>
  		</td>
  	</tr>
  	
  	</table>
  </div>
</body>
</html>