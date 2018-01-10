<!DOCTYPE html>
<html>
<head>
<title>Setup</title>
<meta name="layout" content="main"/>
<script>
$(document).ready(function(){
	$('#orgNext').click(function(){
		submitOrgInfo()
	})
})

var submitOrgInfo = function(){
	if(isEmail($('#email').val())){
		$.post('${createLink(controller:'tastTracker',action:'addNewOrganization')}',$("#orgDataForm").serialize(),function(data){
			if(data=='failed'){
				openDialog('Organization is already exists please try with another Name')
			}else{
				window.location.href='${createLink(controller:'tastTracker',action:'addDepartment')}'
			}
		});
	}else{
		openDialog('not a valid email')
		}
	}

var isEmail = function(email){
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/; 
        return regex.test(email);
}

</script>

</head>
<body>
  <div class="orgDiv" style='background-color:clear;margin-left:250px;margin-top:50px;'>
		<form id='orgDataForm'>
		<table style="margin-left:200px;margin-top:80px;">
		<tr>
			<td>
				<input type='text' id='orgName' name='orgName' class='form-control' placeholder='Organization Name' style="width:300px;"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type='text' id='email' name='email' placeholder='email@org.com' class='form-control' style='margin-top:10px;width:300px;' required/>
			</td>
		</tr>
		<tr>
			<td>
				<input type='text' id='phone' name='phone' placeholder='Phone' class='form-control' style='margin-top:10px;width:300px;' required/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="email" id='empCount' name='empCount' class='form-control' placeholder='Emp Count' style='margin-top:10px;width:300px;' />
			</td>
		</tr>
		</table> 
		</form>
		<table style="margin-left:200px;margin-top:10px;">
		<tr>
			<td>
				<input type='button' id='orgNext' class='bigButton btn btn-info btn-lg' value='Next' style='mergin-left:50px;margin-top:10px;' />
			</td>
		</tr>
  		</table>
  </div>
</body>
</html>
