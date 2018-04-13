<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Leave Info</title>
<script>
	$(function(){
		$("#tabs").tabs({
				ajaxOptions:{
				error: function(xhr,status,index,anchor){
					(anchor.hash).html(
						"Couldn't load this tab. We'll try to fix this as soon as possible. ");
					},
				},

				activate: function(event, ui) {
					var selector = ui.newPanel.selector;
					if(selector=="#manageUserResult"&&$.trim($("#manageUserResult").html())==''){
						loadAdminUser();
					}
					else if(selector=="#editOrganizationResult"&&$.trim($("#editOrganizationResult").html())==''){
						loadOrgInfo()
					}
					else if	(selector=="#otherSettingResult"&&$.trim($("#departmentSetting").html())==''){
						openOtherSetting()
					}
			    },

			});
		$("#tabs").bind("click", function(){
			});
		})
</script>
</head>
<body>
	<div id="tabs">
		<ul>
			<li><a href="#leaveInfoResult">Leave Info</a></li>
			<li><a href="#leaveHistoryResult">Leave History</a></li>
		</ul>

	<div id="leaveInfoResult"></div>
	<div id="leaveHistoryResult"></div>
	</div>
</body>
</html>