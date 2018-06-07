<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<script>
$(function(){
		$("#tabs").tabs({

			ajaxOptions: {
				error: function( xhr, status, index, anchor ) {
					$(anchor.hash).html(
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

		
	 	loadAdminUser();
	});

var loadAdminUser = function(){
		$("#manageUserResult").html('');
		$.post('${createLink(controller:"admin",action:"manageUser")}',function(data){
			$("#manageUserResult").html(data);
		});
	}


var isValidate = function() {
		var valid = true;
		$('input[type=text]').each(function() {
		if (this.value == "")
			valid = false
   		})
   		return valid
   	}

var select = function(link){
	$("#tabs a").css({'color':'black'});
	$("#tabs a").css({'background-color':'white'});
	$(link).css({'background-color':'#8E96F1'});
	$(link).css({'color':'white'});
}

var loadOrgInfo = function(){
		$("#editOrganizationResult").html('');
		$.post('${createLink(controller:"admin",action:"getOrganizationData")}',function(data){
			$("#editOrganizationResult").html(data);
		})
	}

var removeRow = function(button){
	$(button).parent().parent().remove();
	
}

var emptyBlockes = function(){
	var empty=0
	$('input[type=text]').each(function(){
		if(this.value==""){
			empty++
		}
	})
	return empty
}

var openOtherSetting = function(){
	$("#departmentSetting").html('');
		$.post('${createLink(controller:'admin',action:'getAllDepartments')}',function(data){
			$("#departmentSetting").html(data);
		});
	
}

</script>
</head>
<body>
<div id="tabs" style="max-height:100%" >
<ul  class="appText">
  <li><a  href="#manageUserResult" >Manage Users</a></li>
  <li><a href="#editOrganizationResult">Organization Settings</a></li>
  <li><a href="#otherSettingResult">Other Settings</a></li>
  <li><a href="#userPermissionResult">User Privileges</a></li>
</ul>
    <div  id="manageUserResult" ></div>
    <div id="editOrganizationResult" style="margin-left:10%;height:100%;display: inline-block;margin-top:20px;display:none;"></div>
	<div id="otherSettingResult" style="height:100%">
	<div id="departmentSetting"></div>
	</div>
	<div  id="userPermissionResult" ></div>
</div>
</body>
</html>