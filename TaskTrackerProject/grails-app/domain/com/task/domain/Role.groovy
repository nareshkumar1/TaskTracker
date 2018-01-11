package com.task.domain

class Role implements Serializable{
	
	long roleId
	String role
	OrganizationInfo organization

    static constraints = {
    
		}
	
	def beforeInsert(){
		if(!roleId&&roleId==0){
			def nextRoles = Role.executeQuery('select max(roleId)+1 from Role where organization=:organization',['organization':organization])
			this.roleId =(nextRoles&&nextRoles[0])?nextRoles[0]:1
		}
		
	}
	static mapping = {
			id composite:['roleId','organization']
		}
}
