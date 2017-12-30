package com.task.domain

import java.io.Serializable;

class OrganizationInfo implements Serializable{
		long orgId
		String orgName
		String orgEmail
		int employeeCount
		
		
		
		static hasMany =[userLogin:UserLoginInfoLocation]
		
	static mapping = {
			id name:'orgId',generator: 'assigned'
	}
		
    static constraints = {
		orgName unique:true
		orgId unique:true
    }
}
