<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Insert title here</title>
</head>
<script>
var addEmployee = function(){
	$.post('${createLink(controller:"tastTracker",action:"saveEmployee")}',$("#employeeForm").serialize(),function(data){
			
		});
}

</script>
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
  			<input type='text' name='userName' id='userName' class='form-control' placeholder="User name"/>
  		</td>
  		<tr>
  		<td>
  			<input type='password'  name='Password' id='Password' class='form-control' placeholder="Password"/>
  		</td>
  		</tr>
  		<tr style='height:70px'>
  		<td>
  			<input type='email' name='email' id='Email' class='form-control' placeholder="Email Address"/>
  		</td>
  		</tr>
  		<tr>
  			<td>
  				<g:select class="dropdown-toggle form-control" data-toggle="dropdown" name="deptName" noSelection="${['':'Select Department']}" from="${dept?.departmentName}" />
  			</td>
  		</tr>
  		<tr style='height:70px'>
  			<td>
  				<g:select class="dropdown-toggle form-control" data-toggle="dropdown" name="roleName" noSelection="${['':'Select Role']}" from="${role?.role}" />
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<input type='button' value='Submit' class='bigButton shadowBox btn btn-info btn-lg'>
  			</td>
  		</tr>
  		</table>
  	</div>
  	</form>
  </div>
  </div>
</body>
</html>