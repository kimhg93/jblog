package kr.co.itcen.jblog.security;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.itcen.jblog.vo.UserVo;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(true);
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		Map pathVariables = (Map) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE); 
		if(pathVariables==null) {
			response.sendRedirect(request.getContextPath()+"/"+authUser.getId());
			return false;
		}
		if(authUser==null) {
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
		 if(!pathVariables.get("id").equals(authUser.getId())) {
		  response.sendRedirect(request.getContextPath()+"/"+authUser.getId()); 
		  return false; 
		  }
		 
		
		return true;
	}
}
