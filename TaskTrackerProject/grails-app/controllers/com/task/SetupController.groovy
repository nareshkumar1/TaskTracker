package com.task

import com.task.domain.OrganizationInfo
import com.task.domain.LocationDepartment
import com.task.domain.Role
import com.taskTracker.utils.Utilities
import com.task.domain.UserLoginInfo


class SetupController{
	
	def setupService
	def grailsApplication
	
	
	 def createNewAccount = {
		render (view:'/setup/createNewAccount')
	}
	 
	def addNewOrganization = {
		def orgId = Utilities.generateOrganizationId()
		def orgName = OrganizationInfo.findByOrgName(params.orgName)
		if(orgName){
			render 'failed'
		}else{
			setupService.addOrganization(orgId,params.orgName,params.email,params.empCount.toInteger(),params.phone)
			session['organization']=OrganizationInfo.findByOrgId(orgId)
			render 'success'
		}
	}
	
	 def addDepartment ={
		 render(view:'/setup/createDepartment')
	}
	
	 def doAddDepartment = {
		 def department = params.depName.class.isArray()?params.depName:[params.depName]
		 department.each{deptName->
			def dept =LocationDepartment.findByDepartmentNameAndOrganization(deptName,session.organization)
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
	 
	 def createNewEmployee = {
		 def dept = LocationDepartment.findAllByOrganization(session.organization)
		 def roles = Role.findAllByOrganization(session.organization)
		render (view:'/setup/createNewEmployee',model:['dept':dept,'role':roles])
	
	 }
	 
	def saveUser = {
		def org =OrganizationInfo.findByOrgId(session.organization.orgId)
		def userId = params.email
		def password =params.password
		def empId =params.empId
		def isAdmin=false
		def userFullName =params.userFullName
		def userEmail =params.email
		def deptName = params.deptName
		def isActive =true
		def role = params.roleName
		if(params.deptName=='Admin'){
			isAdmin=true
		}
		if(!UserLoginInfo.findByUserName(userId)){
		setupService.createNewUser(org,userId,userEmail,password,isAdmin,userFullName,isActive,deptName,role,empId)
		render 'success'
		}
		else{
		render 'User is already registered please try with new Email Id'
		}
	 }

}
