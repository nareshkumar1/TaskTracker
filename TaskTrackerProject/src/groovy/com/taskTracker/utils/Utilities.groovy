package com.taskTracker.utils

class Utilities {
	
	static void main(arg){
		generateOrganizationId()
	}

	static def generateOrganizationId(){
		long orgId=0
		orgId =Math.abs(new Random().nextInt()%9000000)+1000000
		println orgId.class
		return orgId
	}
}
