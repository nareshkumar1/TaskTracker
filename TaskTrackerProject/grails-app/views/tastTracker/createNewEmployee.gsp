<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Insert title here</title>
</head>
<body>
  <div class="body">
  <div style='margin-left:100px; margin-top:50px'>
  	<form action="">
  		<table style='' class='userTable'>
  		<tr >
  		<td>
  			<input type='text' id='userFullName' class='dataField' placeholder="Full Name"/>
  		</td>
  		<tr style='height:70px'>
  		<td>
  			<input type='text' id='userName' class='dataField' placeholder="User name"/>
  		</td>
  		<tr>
  		<td>
  			<input type='password' id='Password' class='dataField' placeholder="Password"/>
  		</td>
  		</tr>
  		<tr style='height:70px'>
  		<td>
  			<input type='email' id='Email' class='dataField' placeholder="Email Address"/>
  		</td>
  		</tr>
  		</table>
  	</form>
  <button type='button' id='submit' class='bigButton'>Submit</button>
  </div>
  </div>
</body>
</html>