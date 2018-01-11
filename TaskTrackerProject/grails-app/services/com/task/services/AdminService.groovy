package com.task.services

import grails.transaction.Transactional

import com.task.domain.OrganizationInfo
import com.task.domain.UserDepartmentRole
import com.task.domain.UserLoginInfo
import com.task.domain.UserLoginInfoLocation
import com.task.domain.LocationDepartment
import com.task.domain.Role

@Transactional
class AdminService {

    def addOrganization(def orgId,def orgName,def orgEmail,def empCount,def phone) {
			def organization = new OrganizationInfo()
			organization.setOrgId(orgId)
			organization.setOrgName(orgName)
			organization.setOrgEmail(orgEmail)
			organization.setPhone(phone)
			organization.setEmployeeCount(empCount)
			organization.save(flush:true)
			/*addDepartment(dept,organization)
			createNewUser(organization,orgEmail,'admin',true,orgName)*/
		}
	
	def createNewUser(def org, def userId, def email, def password, def isAdmin, def userFullName,def isActive,def deptName,def role){
			def user = new UserLoginInfo()
			user.setUserName(userId)
			user.setPassword(password)
			user.setIsAdmin(isAdmin)
			user.setEmailId(email)
			user.setUserFullName(userFullName)
			user.setIsActive(isActive)
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
	
	/*def addDepartment(def department,def org){
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
	*/
	def checkUser(def userId){
		def user = UserLoginInfo.findByUserName(userId)
		if(user){
				
		}
	}
}
