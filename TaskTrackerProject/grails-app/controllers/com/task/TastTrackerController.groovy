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
			def ignoreMethods = ['login','createNewAccount','resetPassword','addDepartment','doAddDepartment','addRole','createNewEmployee']
			if(!ignoreMethods.contains(requestAction)&&session['user']==null&&session['organization']==null){
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
		def orgName = OrganizationInfo.findByOrgName(params.orgName)
		if(orgName){
			render 'failed'
		}else{
			adminService.addOrganization(orgId,params.orgName,params.email,params.empCount.toInteger(),params.phone)
			session['organization']=OrganizationInfo.findByOrgId(orgId)
			render 'success'
		}
	}
	
	 def addDepartment ={
		 render(view:'/tastTracker/createDepartment')
	}
	
	 def doAddDepartment = {
		 def department = params.depName.class.isArray()?params.depName:[params.depName]
		 department.each{deptName->
			def dept =LocationDepartment.findByDepartmentNameAndOrganization(deptName,session.organization)
				println 'session orgId '+session.organization.orgId	
			if(!dept){
				dept =new LocationDepartment('organization':session.organization,'departmentName':deptName).save(flush:true)
				dept.save(flush:true)
				render 'success'
			}else{
				dept.departmentName=deptName
				dept.organization=session.organization
				dept.save(flush:true)
				render 'success'
			}
		}
	 }
	 
	 def addRole = {
		 def roles =params.roleName.class.isArray()?params.roleName:[params.roleName]
		 roles.each{role->
			 def orgRole = Role.findByOrganizationAndRole(session.organization,role)
			 if(orgRole){
				 orgRole.role=role
				 orgRole.organization=session.organization
				 orgRole.save(flush:true)
			 }else{
			 	orgRole = new Role(['role':role,'organization':session.organization])
				orgRole.save(flush:true)
				 render 'success'
			 } 
		 }
	 }
	 
	 def logout = {
		 if(session)
		 session.invalidate()
		 
		 redirect (url:grailsApplication.config.logout.url)
	 }
	 
	 def createNewEmployee = {
		 def dept = LocationDepartment.findAllByOrganization(session.organization)
		 def roles = Role.findAllByOrganization(session.organization)
		render (view:'/tastTracker/createNewEmployee',model:['dept':dept,'role':roles])
	
	 }
	 
	def saveUser = {
		def org =OrganizationInfo.findByOrgId(session.organization.orgId)
		def userId = params.userName
		def password =params.password
		def isAdmin=false
		def userFullName =params.userFullName
		def userEmail =params.email
		def deptName = params.deptName
		def isActive =true
		def role = params.roleName
		if(params.deptName=='Admin')
			isAdmin=true		
		adminService.createNewUser(org,userId,userEmail,password,isAdmin,userFullName,isActive,deptName,role)
		render 'success'
	 }
	 
	 def resetPassword = {
		 def userName = UserLoginInfo.findByUserName(params.userName)
		 if(userName){
			 render "success"
		 }else{
		 	 render "failure"
		 }
	 }
	 def editProfile ={
		 render (view:'/tastTracker/editUser')
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