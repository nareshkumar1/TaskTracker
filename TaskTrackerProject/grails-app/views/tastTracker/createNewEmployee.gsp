<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Insert title here</title>
</head>
<script>
var addEmployee = function(){
	
}

</script>
<body>
  <div>
  <div style='margin-left:400px; margin-top:50px'>
  	<form action="">
  	<div class="input-group">
  		<table style='style="margin-left:300px'>
  		<tr style='height:70px'>
  		<td>
  		<g:select class="dropdown-toggle form-control" data-toggle="dropdown" name="deptName" noSelection="${['':'Select Department']}" from="${dept.departmentName}" />
  		</td>
  		</tr>
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
  			<input type='email' name='Email' id='Email' class='form-control' placeholder="Email Address"/>
  		</td>
  		</tr>
  		<tr><td><input type='button' value='Submit' class='bigButton shadowBox btn btn-info btn-lg'></td></tr>
  		</table>
  	</div>
  	</form>
  </div>
  </div>
</body>
</html>