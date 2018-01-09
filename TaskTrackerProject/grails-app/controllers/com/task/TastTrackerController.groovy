package com.task

import com.task.domain.UserLoginInfo
import com.task.domain.OrganizationInfo
import com.task.domain.LocationDepartment
import com.taskTracker.utils.Utilities
import com.task.domain.Role


class TastTrackerController {

	def adminService
	def grailsApplication
   
	static beforeInterceptor = {
			def requestAction = actionName
			def ignoreMethods = ['login','createNewAccount','resetPassword','addDepartment','createNewEmployee']
			if(!ignoreMethods.contains(requestAction)&&session['user']==null){
				redirect (url:grailsApplication.config.logout.url)
			}
			return
		}
	
	 def index = {
		render (view:'/tastTracker/homepage')
		}
	
	 def login = {
			def user = UserLoginInfo.findByUserName(params.userName)
			if(user){
				if(user.password==params.password){
					session['user']=user
					println session['user'].getOrganizationName()[0]
					redirect(action:'index')
				}else{
				 	render 'failed'
				
			}
		}
	}

	 def createNewAccount = {
		render (view:'/tastTracker/createNewAccount')
	}
	 
	def addNewOrganization = {
		def orgId = Utilities.generateOrganizationId()
		def orgName = OrganizationInfo.findByOrgNameAndOrgId(params.orgName,orgId)
		if(orgName){
			render 'failed'
		}else{
			def org = adminService.addOrganization(orgId,params.orgName,params.email,params.empCount.toInteger()	)
			render 'success'
		}
	}
	
	 def addDepartment ={
		 render(view:'/tastTracker/createDepartment')
	}
	
	 def doAddDepartment = {
		 def department = params.depName
		 department.each{deptName->
			def dept =LocationDepartment.findByDepartmentNameAndOrganization(deptName,session.organization)
			if(!dept){
				new LocationDepartment('Organization':session.organization,'departmentName':deptName).save(flush:true)
				render "successful"
			}else{
				dept.departmentName=deptName
				dept.organization=session.organization
				dept.save(flush:true)
				render 'updated'
			}
		}
	 }
	 
	 def addRole = {
		def role = Role.findByOrganizationAndRole(session.organization,params.roleName)
	 }
	 
	 def logout = {
		 if(session)
		 session.invalidate()
		 
		 redirect (url:grailsApplication.config.logout.url)
	 }
	 
	 def createNewEmployee = {
		 def dept = LocationDepartment.findAllByOrganization(session.organization)		
		render (view:'/tastTracker/createNewEmployee',model:['dept':dept])
	
	 }
	 
	def saveEmployee = {
		def org =OrganizationInfo.findByOrgId(session.organization.orgId)
		def userId = params.userName
		def password =params.password
		def isAdmin=true
		def userFullName =params.userFullName
		def userEmail =params.email
		def deptName = params.deptName
		def isActive =true
		def role = 
		adminService.createNewUser(org,userId,password,isAdmin,userFullName,isActive,deptName,role)
	 }
	 
	 def resetPassword = {
		 def userName = UserLoginInfo.findByUserName(params.userName)
		 if(userName){
			 render "success"
		 }else{
		 	 render "failure"
		 }
	 }
	 
	 def changePassword = {
		 render (view:"/tastTracker/changePassword")
	 }
	 
	 def doChangePassword ={
		 def user = UserLoginInfo.findByUserName(session.user.userName)
		 if(user){
			 user.setPassword(params.password)
			 user.save(flush:true)
			 render 'success'
		 }
	 }
	 
}