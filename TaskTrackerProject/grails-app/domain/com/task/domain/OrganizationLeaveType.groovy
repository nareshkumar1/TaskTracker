package com.task.domain

import com.task.domain.OrganizationInfo

class OrganizationLeaveType implements Serializable {

	OrganizationInfo organization
	long leaveTypeId
	String leaveName
	int leaveCount
	String leaveFrequency
	
	
    static constraints = {
    }
	
	static mapping = {
		
		id composite:['organization','leaveTypeId']
	}
	
	def beforeInsert(){
		def leaveIds = OrganizationLeaveType.executeQuery("select max(leaveTypeId)+1 from OrganizationLeaveType where organization=:organization",['organization':organization])
		this.leaveTypeId = (leaveIds&&leaveIds[0])?leaveIds[0]:1
		} 
}
