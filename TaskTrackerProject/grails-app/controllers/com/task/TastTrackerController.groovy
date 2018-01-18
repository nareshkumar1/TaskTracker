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
	 
	def logout = {
		 if(session)
		 session.invalidate()
		 
		 redirect (url:grailsApplication.config.logout.url)
	 }
	 
	def resetPassword = {
		 def userName = UserLoginInfo.findByUserName(params.emailId)
		 if(userName){
			 render "success"
		 }else{
		 	 render "failure"
		 }
	 }
	 
	def editUser = {
		 render (view:'/tastTracker/editUser')
	 }
	 
	def doEditUser = {
		 def user = UserLoginInfo.findByUserName(params.userName)
		 user.userFullName=params.fullName
		 user.emailId=params.email
		 user.employeeId=params.empId
		 session.user.userFullName=params.fullName
		 session.user.emailId=params.email
		 session.user.employeeId=params.empId
		 user.save(flush:true,failOnError: true)
		 render 'success'
	 }
	 
	def changePassword = {
		 render (view:"/tastTracker/changePassword")
	 }
	 
	def doChangePassword ={
		 def user = UserLoginInfo.findByUserName(session.user.userName)
			 user.password = params.password.trim()
			 user.save(flush:true,failOnError: true)
			 render 'success'
	 }
	 
}