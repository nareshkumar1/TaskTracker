package com.task.domain

import com.task.domain.UserLoginInfoLocation

class UserLoginInfo implements Serializable{
	String userName
	String password
	String userFullName
	String employeeId
	String emailId
	boolean isAdmin=false
	boolean isActive=true
		
	static hasMany = [userLogins:UserLoginInfoLocation]
	
	

	static constraints = {
		employeeId nulable:true
	}
	
	static mapping = {
		
	}
	
	def getOrganizationName = {
		return userLogins.collect(){it?.orgInfo.orgName}
	}
	
	def getOrganizations = {
		return userLogins.collect(){it?.orgInfo}
	}
}
