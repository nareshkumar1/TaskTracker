<script type="text/javascript">
    $(document).ready(function(){
        $('#employeeTable').dataTable({
        	paging: false,
        	scrollY:400,
        	bInfo:false
         	});

        $("#employeeTable tbody tr").on('click',function(event) {
        	$("#employeeTable tbody tr").css({'background-color':'white'});
    		$("#employeeTable tbody tr").css({'color':'black'});
    		$(this).css({'background-color':'#8E96F1'});
    		$(this).css({'color':'white'});
    		openUser(this);
    	});

        $("#saveButton").click(function() {
			addUser();
		});

		
   });

	var clear = function() {
		clearData();
	}


	var isValidate = function() {
		var valid = true;
		$('#newUserForm input').each(function() {
			if (this.value == "")
				valid = false
		})
		return valid
	}

	var fieldValidation = function(element) {
		var text = $(element).val()
		if ($(element).val().length == 0)
			alert(text)
	}

	var openUser = function(tr){
		
		$("#newUserForm #userId").val($(tr).find("td:eq(0)").html());
		$("#newUserForm #userFullName").val($(tr).find("td:eq(3)").html());
		$("#newUserForm #empId").val($(tr).find("td:eq(2)").html());
		$("#newUserForm #email").val($(tr).find("td:eq(4)").html());
		$("#newUserForm #password").val($(tr).find("td:eq(1)").html());
		$("#newUserForm #deptName").val($(tr).find("td:eq(5)").html());
		$("#newUserForm #roleName").val($(tr).find("td:eq(6)").html());
		$("#newUserForm #isActive").val($(tr).find("td:eq(7)").html());
		$("#newUserLabel").text("Edit User");
	}
	    
	var clearData = function(){
		$("#newUserForm #userId").val("0");
		$("#newUserForm #userFullName").val("");
		$("#newUserForm #empId").val("");
		$("#newUserForm #email").val("");
		$("#newUserForm #password").val("");
		$("#newUserForm #deptName").val("");
		$("#newUserForm #roleName").val("");
		$("#newUserForm #isActive").val("Active");
		$("#newUserLabel").text("Add New User");
		$("#employeeTable tbody tr").css({'background-color':'white'});
		$("#employeeTable tbody tr").css({'color':'black'});
	    }
		
   	 	
    var addUser = function() {
    	if (isValidate() == true) {
    		$.post('${createLink(controller:"admin",action:"saveUser")}',$("#newUserForm").serialize(), function(data) {
    			if (data == 'success') {
    					loadAdminUser();
        				openDialog(data)
    				} else {
    					openDailog(data)
    				}
    			});
    		} else {
    			openDialog("Please fill all details")
    		}
    	}

</script>
<style>
.row_selected {
	background-color: #8E96F1;
	color: white;
}
</style>
</head>
<body>
<div style="margin-left:50px;height:50%;width:60%;display: inline-block;margin-top:20px">
	<table id="employeeTable" class="table table-condensed table-hover table-bordered" style="font-family:'Helvetica', 'Arial', sans-serif">
		<thead>
			<tr>
				<th style="display:none"></th>
				<th style="display:none"></th>
				<th>Employee Id</th>
				<th>Name</th>
				<th>User Id</th>
				<th>Department</th>
				<th>Designation</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
		<g:each in="${users}" var="user">
			<tr >
				<td style="display:none">${user.deptEmpl.id}</td>
				<td style="display:none">${user.deptEmpl.password}</td>
				<td>${user.deptEmpl.employeeId}</td>
				<td>${user.deptEmpl.userFullName}</td>
				<td>${user.deptEmpl.userName}</td>
				<td>${user.dept.departmentName}</td>
				<td>${user.deptRole.role}</td>
				<g:if test="${user.deptEmpl.isActive==true}">
				<td>Active</td>
				</g:if>
				<g:else>
				<td style="background:red;color:white">InActive</td>
				</g:else>
			</tr>
		</g:each>
		</tbody>
	</table>
</div>
<div id="resultData" class="input-group appText" style="width:300px;margin-top:20px;margin-left:100px;display:inline-block">
<div id="oldData">
	<form id="newUserForm">
	<div class="input-group">
		<label id="newUserLabel" style="display:block;text-align:center" class="appText">Add New User</label>
		<table id="newUserTable" class="margin-top:100px">
			<tr>
				<td><input id="userId" name="userId" type="text" hidden=true value="0"></td>
			</tr >
			<tr style='height: 60px'>
				<td><input  id="userFullName" name="userFullName" type="text" placeholder="Employee Name" class='form-control'  onchange="fieldValidation(this)"></td>
			</tr>
			<tr style='height: 60px'>
				<td><input  id="empId" name="empId" type="text" placeholder="Employee Id" class='form-control'></td>
			</tr>
			<tr style='height: 60px'>
				<td><input  id="email"  name="email" type="text" placeholder="Email/User Name" class='form-control'></td>
			</tr>
			<tr style='height: 60px'>
				<td><input  id="password" name="password" type="text" placeholder="Password" class='form-control'></td>
			</tr>
			<tr style='height: 60px'>
				<td>
					<g:select id='deptName' name="deptName" class="dropdown-toggle form-control" data-toggle="dropdown" name="deptName" noSelection="${['':'Select Department']}" from="${dept?.departmentName}" />
				</td>
			</tr>
			<tr style='height: 60px'>
				<td>
					<g:select id='roleName' name="roleName" class="dropdown-toggle form-control" data-toggle="dropdown" name="roleName" noSelection="${['':'Select Role']}" from="${role?.role}" />
				</td>
			</tr>
			<tr style='height: 60px'>
				<td>
					<g:select id='isActive' name="isActive" class="dropdown-toggle form-control" data-toggle="dropdown"  from="['Active','InActive']" />
				</td>
			</tr>
			<tr style='height: 60px'>
				<td><input style="text-align: center;margin-left:0px" id="saveButton" type="button" value="Save"  class='okButton shadowBox btn btn-info btn-sm'>
				<input style="text-align: center;margin-left:200px;margin-top:-52px" id="clearButton" type="reset" value="Clear"  class='okButton shadowBox btn btn-info btn-sm' onclick="clearData()"></td>
			</tr>
		</table>
		</div>
	</form>
	</div>
	</div>
</body>
