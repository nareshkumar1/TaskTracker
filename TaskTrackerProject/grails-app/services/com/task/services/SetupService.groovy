package com.task.services

import com.task.domain.OrganizationInfo
import com.task.domain.UserDepartmentRole
import com.task.domain.UserLoginInfo
import com.task.domain.UserLoginInfoLocation
import com.task.domain.LocationDepartment
import com.task.domain.Role

import grails.transaction.Transactional

@Transactional
class SetupService {

     def addOrganization(def orgId,def orgName,def orgEmail,def empCount,def phone) {
			def organization = new OrganizationInfo()
			organization.setOrgId(orgId)
			organization.setOrgName(orgName)
			organization.setOrgEmail(orgEmail)
			organization.setPhone(phone)
			organization.setEmployeeCount(empCount)
			organization.save(flush:true)
		}
	
	def createNewUser(def org, def userId, def email, def password, def isAdmin, def userFullName,def isActive,def deptName,def role,def employeeId){
		def user = new UserLoginInfo()
			user.userName=userId
			user.password=password
			user.isAdmin=isAdmin
			user.emailId=email
			user.userFullName=userFullName
			user.isActive=isActive
			user.employeeId=employeeId?employeeId:''
			def userLocation = new UserLoginInfoLocation(['user':user,'orgInfo':org])
			def department = LocationDepartment.findByOrganizationAndDepartmentName(org,deptName)
			def userRole =Role.findByOrganizationAndRole(org,role)
			def userDepartment = new UserDepartmentRole(['user':user,'locationDepartment':department,'role':userRole])
			user.addToUserLogins(userLocation)
			org.addToUserLogin(userLocation)
			org.save()
			user.save(flush:true)
			userDepartment.save(flush:true)
	}
	
	
	def checkUser(def userId){
		def user = UserLoginInfo.findByUserName(userId)
		if(user){
				
		}
	}
}
