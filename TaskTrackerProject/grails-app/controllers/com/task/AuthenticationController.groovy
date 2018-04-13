package com.task

class AuthenticationController {

    def beforeInterceptor = {
			boolean doReturn =false
			if (!session.user&&!params.orgId) {
				response.status = 401;
				if("XMLHttpRequest".equals(request.getHeader("X-Requested-With")))
					render "loginRequired"
				else
					redirect(controller:'tastTracker',action:"logout")
				doReturn = true;
			}
			if(doReturn)
				return false
    }
	
}
