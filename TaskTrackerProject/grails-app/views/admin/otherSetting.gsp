<head>
<script type="text/javascript">
$(document).ready(function(){
	$("#deptTable").dataTable({
		paging:false,
		scrollY:400,
		searching:false,
		bInfo:false,
		order:[[1,"asc"]]
		});	

	$("#roleTable").dataTable({
		paging:false,
		scrollY:400,
		searching:false,
		bInfo:false,
		order:[[1,"asc"]]
		});	

	$("#mapTable").dataTable({
		paging:false,
		scrollY:400,
		searching:false,
		bInfo:false,
		order:[[1,"asc"]]
		});	

	$("#deptTable tbody tr").on('click',function(event) {
    	$("#deptTable tbody tr").css({'background-color':'white'});
		$("#deptTable tbody tr").css({'color':'black'});
		$(this).css({'background-color':'#8E96F1'});
		$(this).css({'color':'white'});
		editDept(this);
	});

	$("#roleTable tbody tr").on('click',function(event) {
    	$("#roleTable tbody tr").css({'background-color':'white'});
		$("#roleTable tbody tr").css({'color':'black'});
		$(this).css({'background-color':'#8E96F1'});
		$(this).css({'color':'white'});
		editRole(this);
	});

	$("#mapTable tbody tr").on('click',function(event) {
    	$("#mapTable tbody tr").css({'background-color':'white'});
		$("#mapTable tbody tr").css({'color':'black'});
		$(this).css({'background-color':'#8E96F1'});
		$(this).css({'color':'white'});
		//editDept(this);
	});

		$("#addDept").click(function(){
			saveDepartment();
			})

		$("#addRole").click(function(){
			saveRole();
			})
});

var saveDepartment = function(){
		$.post('${createLink(controller:'setup',action:'doAddDepartment')}',$("#departmentForm").serialize(),function(data){
				openOtherSetting();
				openDialog(data);
			})
	
}

var saveRole = function(){
	$.post('${createLink(controller:'setup',action:'addRole')}',$("#roleForm").serialize(),function(data){
			openOtherSetting();
			openDialog(data);
		})

}

var editDept = function(tr){
	$("#departmentForm #deptId").val($(tr).find("td:eq(0)").html());
	$("#departmentForm #depName").val($(tr).find("td:eq(1)").html());
}

var editRole = function(tr){
	$("#roleForm #roleId").val($(tr).find("td:eq(0)").html());
	$("#roleForm #roleName").val($(tr).find("td:eq(1)").html());
}
</script>
</head>
<body>

  <div id="addDepartment" style="display:inline-block;margin-top:0px;margin-left:5%">
  	<table id="deptTable" class="table table-condensed table-hover table-bordered"  style="width:200px">
  		<thead>
  			<tr>
  			<th hidden=true>id</th>
  			<th>Department</th></tr>
  		</thead>
  		<tbody>
  		<g:each in="${orgDept}" var="dept">
  			<tr>
  			<td hidden=true>${dept.departmentId}</td>
  			<td>${dept.departmentName}</td>
  			</tr>
  		</g:each>
  		</tbody>  	
  	</table>
  	</div>
  	<div id="deptdiv" style="display:inline-block;margin-top:0%;margin-left:2%;vertical-align: top;">
  	<form id="departmentForm">
  	<label class="appText"> Add new Department</label>
  	<table>
  		<tr>
  			<td>
  				<input id="deptId" name="deptId" type='text' value="0" hidden=true>
  			</td>
  		</tr>
  		<tr style="height:40px">
  		
  			<td>
  				<input id='depName' name='depName' type="text" placeholder="Department Name" class="form-control" >
  			</td>						
  		</tr>
  		<tr style="height:60px">	
  			<td>
  				<input id='addDept' type="button" value="Save" class='okButton shadowBox btn btn-info btn-sm' style="margin-left:10%">
  			</td>
  		</tr>
  	</table>
  	</form>
  	</div>
  <div id="roleDiv" style=";display:inline-block;margin-top:20px;margin-left:5%">
  	<table id="roleTable" class="table table-condensed table-hover table-bordered" style="width:200px">
  		<thead>
  			<tr>
  				<th hidden=true>id</th>
  				<th>Roles</th>
  			</tr>
  		</thead>
  		<tbody>
  			<g:each in="${orgRole}" var="role">
  			<tr>
  			<td hidden=true>${role.roleId}</td>
  			<td>${role.role}</td>
  			</tr>
  		</g:each>
  		</tbody>  	
  	</table>
  </div>
  <div style="display:inline-block;margin-top:0%;margin-left:2%;vertical-align: top;">
  	<form id="roleForm">
  	<label class="appText"> Add New Role</label>
  	<table>
  		<tr>
  			<td>
  				<input id='roleId' name='roleId' type="text" value="0" hidden=true>
  			</td>
  		</tr>
  		<tr style="height:40px">
  			<td>
  				<input id='roleName' name='roleName' type="text" placeholder="Role Name" class="form-control" >
  			</td>
  		</tr>
  		<tr style="height:60px">	
  			<td>
  				<input id='addRole' type="button" value="Save" class='okButton shadowBox btn btn-info btn-sm' style="margin-left:10%">
  			</td>
  		</tr>
  	</table>
  	</form>
  	</div>
  	<div id="mapDiv" style=";display:inline-block;margin-top:20px;margin-left:5%;vertical-align: top">
  	<table id="mapTable" class="table table-condensed table-hover table-bordered" style="width:200px">
  		<thead>
  			<tr>
  				<th hidden=true>id</th>
  				<th>Department</th>
  				<th>Roles Assigned</th>
  			</tr>
  		</thead>
  		<tbody>
  			<g:each in="${orgRole}" var="role">
  			<tr>
  			<td hidden=true>${role.roleId}</td>
  			<td>${role.role}</td>
  			<td>0</td>
  			</tr>
  		</g:each>
  		</tbody>  	
  	</table>
  </div>
</body>
</html>