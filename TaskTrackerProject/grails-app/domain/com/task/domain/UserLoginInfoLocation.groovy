package com.task.domain

import java.io.Serializable;

class UserLoginInfoLocation implements Serializable{

	OrganizationInfo orgInfo	
	static belongsTo = [user:UserLoginInfo]
    
	static constraints = {
    }
	
	static mapping = {
		
	}
	
}
