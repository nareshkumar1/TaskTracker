package com.task.domain

import com.task.domain.UserLoginInfoLocation

class LocationDepartment implements Serializable {
	
	OrganizationInfo organization
	long departmentId
	String departmentName
	
	
	static constraint = {
	}
	
	static mapping = {
		id composite:['organization','departmentId']
	}
	
}
