package com.task.domain

import com.task.domain.UserLoginInfoLocation

class UserLoginInfo implements Serializable{
	String userName
	String password
	String userFullName
	String emailId
	boolean isAdmin=false
	LocationDepartment department
		
	static hasMany = [userLogins:UserLoginInfoLocation]

	static constraints = {
	}
	
	def getOrganizationName = {
		return userLogins.collect(){it?.orgInfo.orgName}
	}
	
	def getOrganizationId = {
		return userLogins.collect(){it?.orgInfo.orgId}
	}
}
