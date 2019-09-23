package com.book.warm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.book.warm.vo.UserVO;

public class BoardInterceptor extends HandlerInterceptorAdapter {
	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		// session 객체를 가져온다.
//		HttpSession session = request.getSession();
//		// login처리를 담당하는 사용자 정보를 담고있는 객체를 가져옴
//		String member = (String)session.getAttribute("user_id");
//		
//		System.out.println("login 상태, id : "+member);
//		
//		if(member==null) {
//			// 로그인 안 돼있는 상태면 로그인 폼으로 돌려보냄.
//			response.sendRedirect(request.getContextPath()+"/login");
//			// 더이상 컨트롤러 요청으로 가지 않도록 false 반환
//			return false;
//		}
//		return true;
//	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable Exception ex) throws Exception {
		
	}

}
