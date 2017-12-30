<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<script>
$(document).ready(function(){
	$("#resetPass").click(function(){
		if($("#password1").val()!=$("#password2").val()||$("#password1").val().length==0){	
		openDialog("Password should be same in both field")	
	}else{
		doResetPassword();
	}
	});
});
</script>
</head>
<body>
  <div>
  	<table>
  	<tr>
  		<td>
  		<label id="user" style="margin-left:70px;">${session.user.emailId}</label>
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
  	<tr style='height:60px;'>
  		<td>
  		<input type="button" class="shadowBox btn btn-info btn-sm" id="resetPass"  value="Reset" style="width:260px"/>
  		</td>
  	</tr>
  	
  	</table>
  </div>
</body>
</html>