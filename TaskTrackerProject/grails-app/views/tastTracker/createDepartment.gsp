<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main"/>
<script type="text/javascript">
$(document).ready(function(){
	var last =
$('#add').click(function(e){
		$('#departmentTable tr:last').before(
				"<tr style='height:40px;'>"
				+"<td><input name='depName' type='text' class='form-control' placeholder='Department Name'></td>"
				+"<td id='deptTd'><a onclick='removeRow(this)' class='btn btn-info btn-sm'>&times;</a>"
				+"</td></tr>"
			)
	})
})
var removeRow = function(button){
	$(button).parent().parent().remove();

}
var addDepartment = function(){
	var dept = $('#depForm').serialize()
	alert(dept)
	$.post('${createLink(controller:"tastTracker",action:"doAddDepartment")}',$("#depForm").serialize(),function(data){

	})
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
			<input name='depName' type='text' class='form-control' placeholder='Department Name'>
		</td>
		<td style='pedding:50px;'>
			<a style='pedding:50px;' type="button" id="add" class="btn btn-info btn-sm">+</a>
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