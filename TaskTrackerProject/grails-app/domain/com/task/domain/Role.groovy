package com.task.domain

class Role implements Serializable{
	
	int roleId
	String role
	OrganizationInfo organization

    static constraints = {
    
		}
	static mapping = { 
			id composite:['roleId','organization']
		}
}
