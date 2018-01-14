<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Setup</title>
</head>
<body>
<div style='backgroun-color:green;margin-left:50%;font-size:20px'>
  <label>UPDATE PROFILE</label>
 </div>
  <div style='margin-left:30%'>
  <table>
  	<tr>
  	<td><label for='userName' class='appFont'>UserId</label></td>
  	<td><input type='text' id='userName' name='userName' class='form-control' value='${session.user.userName}' readOnly ></td>
  	</tr>
    <tr  style='height:70px'>
    <td><label for='fullName' class='appFont'>Username</label></td>
    <td><input type='text' id='fullName' name='fullName' class='form-control' value='${session.user.userFullName}'></td>
    </tr>
    </table>
  </div>
</body>
</html>