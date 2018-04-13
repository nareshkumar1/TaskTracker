<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Home</title>
<script>
var changePassword = function(){
	$.post('${createLink(controller:"tastTracker",action:"changePassword")}',function(data){
			$("#setupData").html(data)
	})
}
var editUser = function(){
	$.post('${createLink(controller:"tastTracker",action:"editUser")}',function(data){
			$("setupData").html("")
			$("#setupData").html(data)
		})
}
</script>
</head>
<body>
  <div id='setupData'></div>
</body>
</html>