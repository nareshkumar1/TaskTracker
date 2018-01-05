<!DOCTYPE html>
<html>
<head>
<title>Add Department</title>
<meta name="layout" content="main"/>
<script type="text/javascript">
$(document).ready(function(){
	var last =
$('#add').click(function(e){
		$('#departmentTable tr:last').before(
				"<tr style='height:40px;'>"
				+"<td><input name='depName' type='text' class='form-control' placeholder='Department Name'></td>"
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
		openDialog("Department name can't be left blank")
		}
	else{
		var dept = $('#depForm').serialize()
		$.post('${createLink(controller:"tastTracker",action:"doAddDepartment")}',$("#depForm").serialize(),function(data){
				openDialog(data)
			if(data=='success'){
				openDialog("successFull")
			}else{
				openDialog("failed")
			}
		})
	}
}	
</script>
</head>
<body>
	<div  class='setupdiv' style='position: absolute'>
	<form id='depForm'>
	<table id='departmentTable' style="margin-left:200px;margin-top:80px;">
	<tbody>
	<tr style='height:40px;'>
		<td>
			<input name='depName' data-toggle="tooltip" data-placement="left" title="Predefined department" type='text' class='form-control' placeholder='Department Name' value='Admin'>
		</td>
		<td style='pedding:50px;'>
			<a style='margin-left:10px;' type="button" id="add" class="btn btn-info btn-sm">+</a>
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
</body>
</html>