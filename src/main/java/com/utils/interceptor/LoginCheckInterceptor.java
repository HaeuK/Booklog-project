package com.utils.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		if (!isSkip(request)) {
			
			HttpSession session = request.getSession();
			Object obj = session.getAttribute("login");
			
			//로그인 체크하는 부분. 개발중에 주석처리 안 할 경우 서버가 재기동 될 때마다 세션이 사라지기 때문에 로그인을 다시 해줘야 함
			if(obj == null){
				response.sendRedirect("/user/login"); //세션에 로그인 정보 없을 경우 redirect시킬 url
				return false;
			}
			
		} 

		return true;
	}
	
	/**
	 * 
	 * @param request
	 * @return
	 * 요청 url에서 로그인 세션이 없어도 접근 가능한 url들을 설정
	 * 해당하는 String값 포함 url일 경우 true 반환
	 */
	private boolean isSkip(HttpServletRequest request) {
		boolean resultFlag = false;
		String requestURI = request.getRequestURI();
		
		if(requestURI.contains("/user")) {
			resultFlag = true;
		} else if (requestURI.contains("/resources")) {
			resultFlag = true;
		}
		return resultFlag;
	}

}
