package com.task.services

import grails.transaction.Transactional

import com.task.domain.OrganizationInfo
import com.task.domain.UserLoginInfo
import com.task.domain.UserLoginInfoLocation
import com.task.domain.LocationDepartment

@Transactional
class AdminService {

    def addOrganization(def orgId,def orgName,def orgEmail,def empCount,def dept) {
			def organization = new OrganizationInfo()
			organization.setOrgId(orgId)
			organization.setOrgName(orgName)
			organization.setOrgEmail(orgEmail)
			organization.setEmployeeCount(empCount)
			organization.save(flush:true)
			session['organization']=OrganizationInfo.findByOrgId(orgId)
			/*addDepartment(dept,organization)
			createNewUser(organization,orgEmail,'admin',true,orgName)*/
		}
	
	def createNewUser(def org,def userId, def password, def isAdmin, def userFullName,def dept){
			def user = new UserLoginInfo()
			user.setUserName(userId)
			user.setPassword(password)
			user.setIsAdmin(isAdmin)
			user.setEmailId(userId)
			user.setUserFullName(userFullName)
			user.setIsActive(true)
			def userLocation = new UserLoginInfoLocation(['user':user,'orgInfo':org])
			user.addToUserLogins(userLocation)
			org.addToUserLogin(userLocation)
			org.save()
			user.save(flush:true)
	}
	
	def addDepartment(def department,def org){
		department.each{deptName->
			def dept =LocationDepartment.findByDepartmentNameAndOrganization(deptName,org)
			if(!dept){
				new LocationDepartment('Organization':org,'departmentName':deptName).save(flush:true)
				return true
			}else{
				return false
			}
		}
	}
	
	def checkUser(def userId){
		def user = UserLoginInfo.findByUserName(userId)
		if(user){
				
		}
	}
}
