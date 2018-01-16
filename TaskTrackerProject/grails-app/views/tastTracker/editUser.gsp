<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Setup</title>
</head>
<body>
<h1 style='backgroun-color:green;margin-left:50%;font-size:20px'>
  <label>UPDATE PROFILE</label>
 </h1>
  <div style='width:100%;margin-top:50px;'>
  <table style='margin-left:30%'>
  	<tr>
  	<td><label for='userName' class='appText'>UserId</label></td>
  	<td><input type='text' id='userName' name='userName' class='form-control' value='${session.user.userName}' readOnly ></td>
  	</tr>
    <tr  style='height:70px'>
    <td><label for='fullName' class='appText'>User Full Name</label></td>
    <td><input type='text' id='fullName' name='fullName' class='form-control' value='${session.user.userFullName}' placeholder="User full Name"></td>
    </tr>
    <tr>
    <td><label for='email' class='appText'>Email</label></td>
    <td><input type='email' id='email' name='email' class='form-control' value='${session.user.emailId}' placeholder="User Email"></td>
    </tr>
    <tr style='height:70px'>
    <td><label for='email' class='appText'>Employee Id</label></td>
    <td><input type='email' id='email' name='email' class='form-control' value='${session.user.employeeId}' placeholder="Employee Id"></td>
    </tr>
    </table>
     <button type='button' value='Save' class='bigButton shadowBox btn btn-info btn-lg' style='margin-left:30%'>Save</button>
  </div>
</body>
</html>