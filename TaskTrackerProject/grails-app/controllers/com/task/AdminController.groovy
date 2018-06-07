package com.task

import com.task.domain.OrganizationInfo
import com.task.domain.OrganizationLeaveType

class AdminController extends AuthenticationController {

	def adminService
	def setupService
	
	def index = {
		render (view:"/admin/setupMain")
	}
	
    def manageUser = {
		session['organization'].refresh()
		//def allUsers =[]
		def orgUsers = adminService.getOrganizaionUser(session.organization)
		def orgDept = adminService.getAllDepartment(session.organization)
		def orgRole = adminService.getAllRoles(session.organization)
		render (view:"/admin/manageUser",model:[users:orgUsers,dept:orgDept,role:orgRole])
	}
	
	def saveUser = {
		def org =OrganizationInfo.findByOrgId(session.organization.orgId)
		def userId = params.userId
		def userName = params.email
		def password =params.password
		def empId =params.empId
		def isAdmin=false
		def userFullName =params.userFullName
		def userEmail =params.email
		def deptName = params.deptName
		def isActive =false
		if(params.isActive=='Active'){
			isActive=true
		}
		def role = params.roleName
		if(params.deptName=='Admin'){
			isAdmin=true
		}
		def users = session.organization.userLogin.collect(){it.user}
		def user =null
		def userExists =false
		users.each{
			if(it.userName == userName){
				userExists=true
				user = it
			}
		}
		if(userExists==false&&userId=="0"){
			setupService.createNewUser(org,userName,userEmail,password,isAdmin,userFullName,isActive,deptName,role,empId)
			render 'success'
		}
		else if(userExists==true&&userId!=0){
			adminService.adminEditUser(user,org,userName,userEmail,password,isAdmin,userFullName,isActive,deptName,role,empId)
			render 'success'
			}
		else{
			render 'User is exists please try with another Email Id'
		}
	 }
	
	def getAllUsers = {
			def userId =Long.valueOf(params.userId)
			def user =adminService.getOrganizaionUserById(session.organization, userId)
			render (view:"/admin/editUser",model:[user:user])
	}
	
	def saveOrganizationDetails = {
		
		def orgId = Long.valueOf(params.orgId)
		def orgName= params.orgName
		def email = params.email
		def empCount = Integer.valueOf(params.empCount)
		def phone = params.phone
		adminService.saveOrganization(orgId, orgName, email,empCount, phone)
		render "success"
	}
	
	def getOrganizationData = {
		def leaves = adminService.getOrgLeaves(session.organization)
		render (view:"/admin/organizationSetup",model:[leaves:leaves])
	}
	
	def addLeaveType = {
			def leaveTypeId = Long.valueOf(params.leaveId)
			def leaveName = params.leaveName
			def totalLeaveCount = Integer.valueOf(params.leaveCount)
			def frequency = params.frequency	
			def leaveType = OrganizationLeaveType.findByOrganizationAndLeaveName(session.organization,leaveName)
			if(leaveType&&leaveTypeId==0){
				render "Leave Type AllReady Exists"
			}else{
			def orgLeveInfo = adminService.addLeaveType(session.organization,leaveTypeId,leaveName,totalLeaveCount,frequency)
			render "Leave added Successfully"
			}
		
	}
	
	def getAllDepartments = {
		def orgDept = adminService.getAllDepartment(session.organization)
		def orgRole = adminService.getAllRoles(session.organization)
		render (view:"/admin/otherSetting",model:[orgDept:orgDept,orgRole:orgRole])
		
		
	}
}
