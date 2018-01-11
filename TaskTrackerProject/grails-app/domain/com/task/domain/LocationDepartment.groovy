package com.task.domain

import com.task.domain.UserLoginInfoLocation

class LocationDepartment implements Serializable {
	
	OrganizationInfo organization
	long departmentId
	String departmentName
	
	static constraint = {
		
	}
	
	def beforeInsert(){
		if(!departmentId&&departmentId==0){
			def nextDepartmentIds = LocationDepartment.executeQuery('select max(departmentId)+1 from LocationDepartment where organization=:organization',['organization':organization])
			this.departmentId =(nextDepartmentIds&&nextDepartmentIds[0])?nextDepartmentIds[0]:1
		}
	}
	
	static mapping = {
		id composite:['organization','departmentId']
	}
	
}
