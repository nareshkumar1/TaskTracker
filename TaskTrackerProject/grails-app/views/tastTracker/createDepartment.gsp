<!DOCTYPE html>
<html>
<head>
<title>Add Department</title>
<meta name="layout" content="main"/>
<script type="text/javascript">
$(document).ready(function(){
$('#addDep').click(function(e){
		$('#departmentTable tr:last').before(
				"<tr style='height:40px;'>"
				+"<td><input name='depName' type='text' class='form-control' placeholder='Department Name'></td>"
				+"<td id='deptTd'><a style='margin-left:10px;' onclick='removeRow(this)' class='btn btn-info btn-sm'>&times;</a>"
				+"</td></tr>"
			)
	})
$('#addRole').click(function(e){
	$('#roleTable tr:last').after(
			"<tr style='height:40px;'>"
			+"<td><input name='roleName' type='text' class='form-control' placeholder='Role Name'></td>"
			+"<td id='deptTd'><a style='margin-left:10px;' onclick='removeRow(this)' class='btn btn-info btn-sm'>&times;</a>"
			+"</td></tr>"
		)
})
	$('[data-toggle="tooltip"]').tooltip();
})
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

var addDepartment = function(){
	if(emptyBlockes()>0){
		openDialog("fields can't be left blank")
		}
	else{
		var dept = $('#depForm').serialize()
		$.post('${createLink(controller:"tastTracker",action:"doAddDepartment")}',$("#depForm").serialize(),function(data){
				openDialog(data)
			if(data=='success'){
				addRole()
			}else{
				openDialog("failed")
			}
		})
	}
}

var addRole =function(){
	if(emptyBlockes()>0){
			openDialog("Fields can't be left blank")
		}else{
			$.post('${createLink(controller:"tastTracket",action:"addRole")}',$("#depForm").serialize(),function(data)){
					if(data=='success'){
						openDialog("successFull")
						window.location.href='${createLink(controller:"tastTracker",index:"createNewEmployee")}'
					}
				}
			}
}
</script>
</head>
<body>
<div>
	<div  class='setupdiv' style='position: absolute'>
	<form id='depForm'>
	<table id='departmentTable' style="margin-left:0px;margin-top:80px;">
	<tbody>
	<tr style='height:40px;'>
		<td>
			<input name='depName' data-toggle="tooltip" data-placement="left" title="Department need to added" type='text' class='form-control' placeholder='Department Name' value='Admin'>
		</td>
		<td style='pedding:50px;'>
			<a style='margin-left:10px;' type="button" id="addDep" class="btn btn-info btn-sm">+</a>
		</td>
	</tr>
	</tbody>
	<tr>
		<td>
			<input type='button' class='bigButton shadowBox btn btn-info btn-lg' value='Next' id='deptNext' onclick='addDepartment()'>
		</td>
	</tr>
	</table>
</form>
</div>
<div class='setupdiv' style='position: absolute;margin-left:700px'>
<form id='roleForm'>
	<table id='roleTable' style="margin-left:0px;margin-top:80px;">
	<tbody>
	<tr style='height:40px;'>
		<td>
			<input name='roleName' data-toggle="tooltip" data-placement="left" title="Roles ie Manager,executive,.." type='text' class='form-control' placeholder='Role Name' value='Admin'>
		</td>
		<td style='pedding:50px;'>
			<a style='margin-left:10px;' type="button" id="addRole" class="btn btn-info btn-sm">+</a>
		</td>
	</tr>
	</tbody>
	</table>
</form>
</div>
</div>	
</body>
</html>