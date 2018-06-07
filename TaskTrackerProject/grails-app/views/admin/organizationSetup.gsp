<head>
<script type="text/javascript">
$(document).ready(function(){
	$("#leaveDataTable").dataTable({
		paging:false,
		scrollY:100,
		searching:false,
		bInfo:false
		});

	$("#leaveDataTable tbody tr").on('click',function(event) {
    	$("#leaveDataTable tbody tr").css({'background-color':'white'});
		$("#leaveDataTable tbody tr").css({'color':'black'});
		$(this).css({'background-color':'#8E96F1'});
		$(this).css({'color':'white'});
		openLeave(this);
	});
	

	$("#orgSaveButton").click(function(){
		$.post('${createLink(controller:"admin",action:"saveOrganizationDetails")}',$("#orgForm").serialize(),function(data){
				if(data=="success")
					openDialog("Organization Information updated")
			});
		});	
});


	var openLeave = function(tr){
		
		$("#newLeaveForm #leaveId").val($(tr).find("td:eq(0)").html());
		$("#newLeaveForm #leaveName").val($(tr).find("td:eq(1)").html());
		$("#newLeaveForm #leaveCount").val($(tr).find("td:eq(2)").html());
		$("#newLeaveForm #frequency").val($(tr).find("td:eq(3)").html());
	}

	var clearData = function(){
    	$("#newLeaveForm #leaveId").val("0");
		$("#newLeaveForm #leaveName").val("");
		$("#newLeaveForm #leaveCount").val("");
		$("#newLeaveForm #frequency").val("");
     }

	var addLeaveType = function(){
		$.post('${createLink(controller:"admin",action:"addLeaveType")}',$("#newLeaveForm").serialize(),function(data){
			openDialog(data);
		});	
	}

    
	
</script>
</head>
<body>
 <div id="oldData" style="display:inline-block">
	<form id="orgForm">
		<label id="orgLabel" style="display:block;text-align:center" class="appText">Edit Organization Details</label>
		<table id="orgTable" style="width:100%">
			<tr style='height: 60px'>
				<td><label for="OrgId">Organization Id</label></td>
				<td>
				<label id="orgId" class="appText">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp ${session.organization.orgId}</label>
				<input name="orgId" type="text" value="${session.organization.orgId}" hidden=true>
				</td>
			</tr>
			<tr style='height: 60px'>
				<td>
				<label for="orgName" class="appText">Organization Name</label></td>
				<td><input  id="orgName" name="orgName" type="text" placeholder="Organization Name" class='form-control' value="${session.organization.orgName}" readOnly></td>
			</tr>
			<tr style='height: 60px'>
				<td>
				<label for="phone" class="appText">Phone </label>
				</td><td>
				<input  id="phone"  name="phone" type="text" placeholder="Phone" class='form-control' value="${session.organization.phone}"></td>
			</tr>
			<tr style='height: 60px'>
				<td>
				<label for="email"  class="appText">Email </label>
				</td><td>
				<input  id="email" name="email" type="text" placeholder="Email" class='form-control' value="${session.organization.orgEmail}"></td>
			</tr>
			<tr style='height: 60px'>
				<td>
				<label for="empCount"  class="appText">Employee count </label>
				</td><td>
				<input  id="empCount" name="empCount" type="text" placeholder="Employee Count" class='form-control' value="${session.organization.employeeCount}"></td>
			</tr>
			
		</table>
			<input style="text-align: center;margin-left:40%;margin-top:5%" id="orgSaveButton" type="button" value="Save"  class='okButton shadowBox btn btn-info btn-sm'>
	</form>
	</div>
   <div id="orgLeave" style="display:inline-block;margin-left:10%;height:300px;width:25%">
   		<table id="leaveDataTable" class="table table-condensed table-hover table-bordered" style="vertical-align: top" >
			<thead>
				<tr>
					<th hidden=true>leaveId</th>
					<th>Leave Type</th>
					<th>Total</th>
					<th>Frequency</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${leaves}" var="leave">
					<tr>
						<td style="display:none">${leave.leaveTypeId}</td>
						<td>${leave.leaveName}</td>
						<td>${leave.leaveCount}</td>
						<td>${leave.leaveFrequency}</td>
					</tr>
				</g:each>
			</tbody>
		</table>
		</div>
		<div style="display:inline-block;margin-left:5%;height:305px">
		
		<form id="newLeaveForm">
		<table>
			<tr><td><input id="leaveId" name="leaveId"  type="hidden" value="0"></td></tr>
			<tr style='height: 60px'>
				<td><input type="text" id="leaveName" name="leaveName" class="form-control" placeholder="Leave Name"></td>
			</tr>
			<tr style='height: 60px'>
				<td><input type="text" id="leaveCount" name="leaveCount" class="form-control" placeholder="Total Leave Count"></td>
			</tr>
			<tr style='height: 60px'>
				<td><g:select id="frequency" name="frequency" class="dropdown-toggle form-control" data-toggle="dropdown"  from="['Monthly','HalfYearly','Yearly']" /></td>
			</tr>
			<tr style='height: 60px'>
				<td><input type="button" value="Save" class="okButton shadowBox btn btn-info btn-sm" style="margin-left:10%" onclick="addLeaveType()"></td>
			</tr>
		</table>
		</form>
	</div>
 </body>
