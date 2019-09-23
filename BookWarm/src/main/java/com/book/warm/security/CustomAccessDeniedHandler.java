package com.book.warm.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {
	
	@Override
	public void handle(HttpServletRequest request, 
						HttpServletResponse response, 
						AccessDeniedException accessException) throws IOException, ServletException {
		
		log.error("Access Denied Handler");
		log.error("Redirect....");
		
		log.info("이유: " + accessException.getCause());
		log.info("메시지: " + accessException.getMessage());
		
		response.sendRedirect("/warm/accessError");
	}
}
