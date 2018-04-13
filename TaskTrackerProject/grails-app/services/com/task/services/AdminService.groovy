package com.task.services

import grails.transaction.Transactional

import com.task.domain.OrganizationInfo
import com.task.domain.UserDepartmentRole
import com.task.domain.UserLoginInfo
import com.task.domain.UserLoginInfoLocation
import com.task.domain.LocationDepartment
import com.task.domain.Role
import com.task.domain.OrganizationLeaveType

@Transactional
class AdminService {

	def getOrganizaionUser(def organization) {
		def users = organization.userLogin.collect(){it.user}
		def orgUsers =[]
		users.each {user->
			def orgUser = UserDepartmentRole.findAllByUser(user).each {empl->
				orgUsers << ['deptEmpl':empl.user,'deptRole':empl.role,'dept':empl.locationDepartment]
			}
		}
		return orgUsers
	}
	
	def getOrganizaionUserById(def organization,def userId) {
		def users = organization.userLogin.collect(){it.user}
		def allUsers =[]
		users.each {user->
			if(user.id==userId){
				def orgUser = UserDepartmentRole.findAllByUser(user).each {empl->
					allUsers << ['deptEmpl':empl.user,'deptRole':empl.role,'dept':empl.locationDepartment]
			}
		}
	}
		return allUsers
	}
	
	def getAllDepartment(def organization){
		def allDepartments = LocationDepartment.findAllByOrganization(organization)
		return allDepartments
	}
	
	def getAllRoles(def organization){
		def allRoles = Role.findAllByOrganization(organization)
		return allRoles		
	}
	
	def adminEditUser(def user,def org, def userId, def email, def password, def isAdmin, def userFullName,def isActive,def deptName,def role,def employeeId){
			user.userName=userId
			user.password=password
			user.isAdmin=isAdmin
			user.emailId=email
			user.userFullName=userFullName
			user.isActive=isActive
			user.employeeId=employeeId?employeeId:''
			def department = LocationDepartment.findByOrganizationAndDepartmentName(org,deptName)
			def userRole =Role.findByOrganizationAndRole(org,role)
			def userDepartment = UserDepartmentRole.findByUser(user)
			userDepartment.user=user
			userDepartment.locationDepartment=department
			userDepartment.role= userRole
			user.save(flush:true)
			userDepartment.save(flush:true)
	}
	
	def saveOrganization(def orgId,def orgName,def orgEmail,def empCount,def phone) {
		def organization = OrganizationInfo.findByOrgIdAndOrgName(orgId,orgName)
		organization.orgEmail=orgEmail
		organization.phone=phone
		organization.employeeCount=empCount
		organization.save(failOnError:true,flush:true)
	}
	
	def addLeaveType(def organization,def leaveId,def leaveName,def leaveCount, def frequency){
		def leaveType = null
		if(leaveId!=0){
			leaveType = OrganizationLeaveType.findByOrganizationAndLeaveTypeId(organization,leaveId)
			leaveType.leaveName = leaveName
			leaveType.leaveCount = leaveCount
			leaveType.leaveFrequency = frequency
			leaveType.save(flush:true)
		}
		else{
			leaveType = new OrganizationLeaveType()
			leaveType.organization =organization
			leaveType.leaveName = leaveName
			leaveType.leaveCount = leaveCount
			leaveType.leaveFrequency = frequency
			leaveType.save(flush:true)
		}
	}
	
	def getOrgLeaves(def organization){
		def orgLeaves = OrganizationLeaveType.findAllByOrganization(organization)
	}
   
}
