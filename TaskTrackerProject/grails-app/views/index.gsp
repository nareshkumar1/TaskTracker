<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta name="layout" content="main"/>
<script>
$(document).ready(function(){

	$("#login").click(function(event){
			validate();
	});

	$('#newAccount').click(function(){
		creatNewAccount()
	});
	
});
var resetPassword = function(){
	$("#errorLable").text("");
	$("#registerdEmail").val("");
	$("#dialog").modal('show');
}

var checkUserName = function(){
	var userId =$("#registerdEmail").val()
	if(userId){
	$.post('${createLink(controller:"tastTracker",action:"resetPassword")}',{"userName":userId},function(data){
			if(data=='success'){
				$("#registerdEmail").val('')
				$("#dialog").modal('hide')
				openDialog("Password has been sent to registered email address")
				}
			else{
				$('#errorLable').text('Please check your email id')
			}
		});
	}else{
		$('#errorLable').text('Please enter Your registered email address')
	}
}
var validate = function(){
	if($("#userName").val().length>0&&$("#password").val().length>0){
		$.post('${createLink(controller:"tastTracker",action:"login")}',{"userName":$("#userName").val(),"password":$("#password").val()},function(data){
			if(data!='failed'){
				window.location.href='${createLink(controller:"tastTracker",action:"index")}'
			}
			else if(data=='disabled'){
				alert(data)
				openDialog("User is Disabled please contact Administrator")
			}
			else{
				alert(data)
				openDialog("Check userName/password")
			}
		});
	}else{
		openDialog("username/password required")
	}
}

var creatNewAccount = function(){
	$('#loginDiv').fadeOut('slow')
	window.location.href='${createLink(controller:"setup",action:"createNewAccount")}'
}

</script>
 </head>
<body>
	<div id='loginDiv' style='height:350px;width:700px;margin-right:0px;margin-left:200px;margin-top:100px; background-color:clear;'>
		<form id='loginForm' name='loginForm'>
		<table style='margin-left:50px;margin-top:150px;height:100px;background-color:clear'>
			<tr>
				<td>
				<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				<input type='text' class='form-control' id="userName" placeholder='User Name' style="width:260px;margin-left:0px;height:45px;border-radius:0px" />
				</div>
				</td>
			</tr>
		<tr style='height:50px;'>
			<td>
			<div class="input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
			<input type='password' class='form-control' id='password' placeholder='Password' style="text:center;width:260px;margin-left:0px;height:45px;border-radius:0px" />
			</div>
			</td>
		</tr>
		<tr>
		<td>
		<div class="checkbox">
    		<label class='appText'><input type="checkbox">Remember me</label>
    		<a id="forgotPassword" href="#" onclick="resetPassword()" style="margin-left:65px;">Forgot password</a>
  		</div>
  		
		</td>
		</tr>
			<tr>
				<td>
				<input type="button" id='login' value="Login" class='bigButton btn btn-info btn-lg' />
				</td>
			</tr>
			<tr style='height:70px;'>
				<td><Button type='button' id='newAccount' class='bigButton shadowBox btn btn-info btn-lg'><span>Become a Member</span></Button></td>
			</tr>
		</table>
		</form>
	</div>
	<div class="modal fade" id="dialog" role="dailog">
	<div class="modal-dialog"  style="width:400px;margin-top:200px">
		<div class="modal-content">
        	<div class="modal-header">
          	<button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Recover Password</h4>
        </div>
        <div class="modal-body">
    <table>
		<tr>
		
		<td><div class="input-group"><span class="input-group-addon">Registered Email </span>
		<input type='text' id='registerdEmail' class="form-control"></div></td>
		</tr>
	</table>
		<p id='errorLable'></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-info btn-lg" onclick="checkUserName()">Next</button>
        </div>
      </div>
	</div>
	</div>
</body>
</html>
