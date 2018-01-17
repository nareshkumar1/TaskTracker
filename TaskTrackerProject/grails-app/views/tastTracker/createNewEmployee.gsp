<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Add User</title>

<script>
$(document).ready(function(){
	$("#saveButton").click(function(){
		addUser()
	})
})

var isValidate = function(){
	var valid = true;
	$('input[type=text]').each(function(){
			if(this.value=="")
				valid=false		
	})
	return valid
}

var addUser = function(){
	if(isValidate()==true){
		$.post('${createLink(controller:"tastTracker",action:"saveUser")}',$("#employeeForm").serialize(),function(data){
			if(data=='success'){
				openDialog('Employee added successfully')
				window.location.href ='${createLink(contoller:"tastTracker",action:"logout")}'
				}
			else{
				openDailog(data)
					}
		});
	}else{
		openDialog("Please fill all details")
	}
}

</script>
</head>
<body>
  <div>
  <div style='margin-left:200px; margin-top:100px'>
  	<form id="employeeForm" >
  	<div class="input-group">
  		<table style='margin-left:200px'>
  		<tr >
  		<td>
  			<input type='text' name='userFullName' id='userFullName' class='form-control' placeholder="Full Name"/>
  		</td>
  		<tr style='height:70px'>
  		<td>
  			<input type='email' name='email' id='email' class='form-control' placeholder="Email Address"/>
  		</td>
  		<tr>
  		<td>
  			<input type='password'  name='password' id='password' class='form-control' placeholder="Password"/>
  		</td>
  		</tr>
  		<tr style='height:70px'>
  			<td>
  				<g:select id='depts' class="dropdown-toggle form-control" data-toggle="dropdown" name="deptName" noSelection="${['':'Select Department']}" from="${dept?.departmentName}" />
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<g:select id='roles' class="dropdown-toggle form-control" data-toggle="dropdown" name="roleName" noSelection="${['':'Select Role']}" from="${role?.role}" />
  			</td>
  		</tr>
  		<tr style='height:70px'>
  			<td>
  				<input type='button' id='saveButton' value='Submit' class='bigButton shadowBox btn btn-info btn-lg'>
  			</td>
  		</tr>
  		</table>
  	</div>
  	</form>
  </div>
  </div>
</body>
</html>